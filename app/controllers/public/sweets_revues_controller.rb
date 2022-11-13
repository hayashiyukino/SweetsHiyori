class Public::SweetsRevuesController < ApplicationController
  def new
    @sweets_revue = SweetsRevue.new
  end

  def index
  end

  def show
  end

  def create
    @sweets_revue = SweetsRevue.new(sweets_revue_params)
    @sweets_revue.review_star = params[:score]
    
    # @sweets_revue.end_user_id = current_end_user.id
    @sweets_revue.end_user_id = 1
    #tag_list = params[:sweets_revue][:tag_name].split(',')
    if @sweets_revue.save
      # @sweets_revue.save_tags(params[:sweets_revue][:tag_ids])
      # @sweets_revue.save_tags[:tag_ids]
      redirect_to root_path
      # redirect_to sweets_revue_path(@sweets_revue), notice: ""
    else
    #   @bsweets_revues = SweetsRevue.all
      #byebug
      render :new
    end
  end


  def edit
  end

  private

  def sweets_revue_params
    params.require(:sweets_revue).permit(
      :end_user_id, :genre_id, :revue_tag_relation_id, :favorite_id, :post_comment_id,  { :tag_ids=> [] },
      :review_star, :sweets_name, :tax_included_price, :sweets_introduction, :shop_name, :buy_place, :post_status)
  end

  # def post_params
  #     params.require(:post).permit(:name, :mode, :desc, { :tag_ids=> [] })
  # end

  # def article_params
  #   params.require(:article).permit(tag_ids:[])
  # end
end
