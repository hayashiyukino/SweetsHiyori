class Public::SweetsRevuesController < ApplicationController

  def new
    @sweets_revue = SweetsRevue.new
  end

  def index
    @sweets_revues = SweetsRevue.all

    if params[:tag_ids]
      @sweets_revues = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_sweets_revues = Tag.find_by(name: key).sweets_revues
          @sweets_revues = @sweets_revues.empty? ? tag_sweets_revues :  @sweets_revues & tag_sweets_revues
        end
      end
    end

    @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @sweets_revues = @genre.sweets_revues.all
    # else
    #   @sweets_revues = SweetsRevue.all
    end
   
  end

  def show
    @sweets_revue = SweetsRevue.find(params[:id])
    @post_comment = PostComment.new
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
      :end_user_id, :genre_id, :revue_tag_relation_id, :favorite_id, :post_comment_id, { :tag_ids=> [] }, :image,
      :review_star, :sweets_name, :tax_included_price, :sweets_introduction, :shop_name, :buy_place, :post_status)
  end

end
