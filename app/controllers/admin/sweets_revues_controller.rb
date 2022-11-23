class Admin::SweetsRevuesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @sweets_revue = SweetsRevue.find(params[:id])
    @post_comment = PostComment.new
    @end_user = @sweets_revue.end_user
  end

  def index
    @sweets_revues = SweetsRevue.page(params[:page]).per(6).order(created_at: :desc)
    @sweets_revue_ids = @sweets_revues.pluck(:id)
    @sweets_revue_review_stars = @sweets_revues.pluck(:review_star)
  end

end
