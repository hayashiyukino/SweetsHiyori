class Public::PostCommentsController < ApplicationController
  def create
    sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
    comment = current_end_user.post_comments.new(post_comment_params)
    comment.sweets_revue_id = sweets_revue.id
    comment.save
    redirect_to sweets_revue_path(sweets_revue)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
