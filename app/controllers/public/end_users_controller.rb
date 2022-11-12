class Public::EndUsersController < ApplicationController
  
  def show
    # @user = current_customer
    # redirect_to mypage_path
    @end_user = EndUser.find(params[:id])
  end
  
  def mypage
    @end_user = current_end_user
  end
  
  def index
  end


  def edit
    @end_user = EndUser.find(params[:id])
  end
  
  
  private

  def end_user_params
    params.require(:end_user).permit(:name, :nickname, :introduction, :image)
  end

end
