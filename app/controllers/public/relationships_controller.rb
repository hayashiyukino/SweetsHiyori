class Public::RelationshipsController < ApplicationController
  before_action :authenticate_end_user!

  # フォローするとき
  # follow(params[:end_user_id])で、models/end_user.rbで定義したメソッドを呼び出す
  def create
    current_end_user.follow(params[:end_user_id])
    @end_user = EndUser.find(params[:end_user_id])
  end
  # フォロー外すとき
  def destroy
    current_end_user.unfollow(params[:end_user_id])
    @end_user = EndUser.find(params[:end_user_id])
  end
  # フォロー一覧
  def followings
    end_user = EndUser.find(params[:end_user_id])
    @end_users = end_user.followings.page(params[:page]).per(15)
  end
  # フォロワー一覧
  def followers
    end_user = EndUser.find(params[:end_user_id])
    @end_users = end_user.followers.page(params[:page]).per(15)
  end

end
