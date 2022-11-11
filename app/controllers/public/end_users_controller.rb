class Public::EndUsersController < ApplicationController
  
  def show
    # @user = current_customer
    # redirect_to mypage_path
    @end_user = EndUser.find(params[:id])
  end
  
  def index
  end


  def edit
  end
  
  
  private

  def end_user_params
    params.require(:end_user).permit(:name, :nickname, :introduction, :profile_image)
  end

end
