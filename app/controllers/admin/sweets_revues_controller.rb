class Admin::SweetsRevuesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @sweets_revue = SweetsRevue.find(params[:id])
    @post_comment = PostComment.new
    @end_user = @sweets_revue.end_user
  end

  def index
    @sweets_revues = SweetsRevue.page(params[:page]).per(12).order(created_at: :desc)
    @sweets_revue_ids = @sweets_revues.pluck(:id)
    @sweets_revue_review_stars = @sweets_revues.pluck(:review_star)
  end

  #投稿の閲覧制限
  def stoppage
    @sweets_revue = SweetsRevue.find(params[:id])
    @sweets_revue.update(post_status: params[:sweets_revue][:post_status])
    redirect_to admin_sweets_revues_path(@sweets_revue)
    #redirect_to admin_sweets_revues_path(@sweets_revue)
  end

end
