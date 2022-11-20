class Public::SweetsRevuesController < ApplicationController

  def new
    @sweets_revue = SweetsRevue.new
  end

  def index
    @sweets_revues = SweetsRevue.all.page(params[:page]).per(9).order(created_at: :desc)
    # @genres = Genre.only_active
    # if params[:genre_id]
    #   @genre = @genres.find(params[:genre_id])
    #   all_items = @genre.items
    # else
    #   all_items = Item.where_genre_active.includes(:genre)
    # end
    # @items = all_items.page(params[:page]).per(12)
    # @all_items_count = all_items.count

    # タグ検索にチェックがついているかどうかを判断するためのフラグ
    tag_is_selected = false
    if params[:tag_ids]
    @sweets_revues = []
    params[:tag_ids].each do |key, value|
      # 送られてきた[tag_ids]が１だったら（タグにチェックがついていたら）
      if value == "1"
        # tag_is_selectedをtrueにする
        tag_is_selected = true
        tag_sweets_revues = Tag.find_by(name: key).sweets_revues
        @sweets_revues = @sweets_revues.empty? ? tag_sweets_revues :  @sweets_revues & tag_sweets_revues
      end
    end
    # unlessはif文の逆。tag_is_selected = falseだったら、左側の記述を実行する。
    # tag_is_selected = false はタグにチェックがついていなかったとき
    @sweets_revues = SweetsRevue.all unless tag_is_selected
    # if params[:genre_id].present? ジャンルが選択されているときに処理を実行する
    @sweets_revues = @sweets_revues.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    end
  end

  def show
    @sweets_revue = SweetsRevue.find(params[:id])
    @post_comment = PostComment.new
    # @end_user = EndUser.find(params[:id])
  end

  def create
    @sweets_revue = SweetsRevue.new(sweets_revue_params)
    # 上の処理でレビューの値がscoreに送られるのでparamsで保存し、review_starカラムに代入する
    @sweets_revue.review_star = params[:score]
    @sweets_revue.end_user_id = current_end_user.id
    if @sweets_revue.save
      redirect_to sweets_revue_path(@sweets_revue), notice: "投稿しました！"
    else
    #   @bsweets_revues = SweetsRevue.all
      #byebug
      # flash.now[:alert] = "投稿に失敗しました"
      # render 'new'
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
      :end_user_id, :genre_id, :revue_tag_relation_id, :favorite_id, :post_comment_id, { :tag_ids=> [] }, :sweets_image,
      :review_star, :sweets_name, :tax_included_price, :sweets_introduction, :shop_name, :buy_place, :post_status)
  end

end
