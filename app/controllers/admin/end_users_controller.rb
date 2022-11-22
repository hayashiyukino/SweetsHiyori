class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @end_users = EndUser.all.page(params[:page]).per(6)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @sweets_revues = @end_user.sweets_revues.all.page(params[:page]).per(5).order(created_at: :desc)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
   if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user.id)
   else
      render :edit
   end
  end
  
  private

  def end_user_params
    params.require(:end_user).permit(
      :name, :nickname, :introduction, :user_status, 
    )
  end
  
  
end
