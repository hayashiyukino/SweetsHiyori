class Public::SweetsRevuesController < ApplicationController
  # indexとshowアクション以外のアクションが動く前にユーザーがログインしていなければルートページが表示される
  before_action :redirect_root, except: [:index, :show]

  def new
    @sweets_revue = SweetsRevue.new
  end

  def index
    # 何も選択していない状態
    # eager_load = SweetsRevueに関連したモデル(:tags)を取ってくる
    @sweets_revues = SweetsRevue.all.eager_load(:tags).page(params[:page]).per(6).order(created_at: :desc)

    # ジャンルを選択した場合
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @sweets_revues = @sweets_revues.where(genre_id: params[:genre_id])
    end

    # タグを選択した状態
    # タグにチェックがついている
    if params[:tag_ids]
      # values=タグの値（タグの値はチェックついていない＝0、チェックがついている＝1で送られてくる
      # １つでも値があるか？
      if params[:tag_ids].values.any?("1")
        # namesという空の配列を用意
        names = []
        # :tag_idsを１つずつ取り出し、key = タグの名前 value = 0 or 1 が入る
        params[:tag_ids].each do |key, value|
          # value == "1"のkeyだけ上でnamesの配列に加える
          names << key if value == "1"
        end
        # @sweets_revuesのeager_load(:tags)の.where = tagsテーブルの:nameカラムがnamesの投稿に絞り込む
        @sweets_revues = @sweets_revues.where(tags: { name: names })
        # 選択したタグと完全一致
        # @sweets_revues = @sweets_revues.select { |sweets_revue| sweets_revue.tags.pluck(:name) == names }
      end
    end
    if params[:genre_id].present? || params[:tag_ids].present?
      @sweets_revues_count = @sweets_revues.count
    else
      @sweets_revues_count = SweetsRevue.all.count
    end
  end

  def show
    @sweets_revue = SweetsRevue.find(params[:id])
    @post_comment = PostComment.new
    @end_user = @sweets_revue.end_user
  end

  def create
    @sweets_revue = SweetsRevue.new(sweets_revue_params)
    # 上の処理でレビューの値がscoreに送られるのでparamsで値を受け取り、review_starカラムに代入する
    @sweets_revue.review_star = params[:score]
    @sweets_revue.end_user_id = current_end_user.id
    if @sweets_revue.save
      redirect_to sweets_revue_path(@sweets_revue), notice: "投稿しました！"
    else
      render :new, notice: "投稿に失敗しました"
    end
  end


  def edit
    @sweets_revue = SweetsRevue.find(params[:id])
  end

  def update
    @sweets_revue = SweetsRevue.find(params[:id])
    if @sweets_revue.update(sweets_revue_params)
      redirect_to sweets_revue_path(@sweets_revue), notice: "編集しました！"
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def sweets_revue_params
    # { :tag_ids=> [] } : 送られてきた値を配列に格納する
    params.require(:sweets_revue).permit(
      :end_user_id, :genre_id, :revue_tag_relation_id, :favorite_id, :post_comment_id, :sweets_image,
      :review_star, :sweets_name, :tax_included_price, :sweets_introduction, :shop_name, :buy_place, :post_status, { :tag_ids=> [] })
  end

  def redirect_root
    redirect_to root_path unless end_user_signed_in?
  end

end
