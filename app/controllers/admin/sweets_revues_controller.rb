class Admin::SweetsRevuesController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @sweets_revue = SweetsRevue.find(params[:id])
    @post_comment = PostComment.new
    @end_user = @sweets_revue.end_user
  end
  
end
