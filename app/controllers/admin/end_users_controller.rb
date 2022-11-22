class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all.page(params[:page]).per(6)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @sweets_revues = @end_user.sweets_revues.all.page(params[:page]).per(5).order(created_at: :desc)
  end

  def edit
  end
end
