class Public::EndUsersController < ApplicationController

  def show
    # @user = current_customer
    # redirect_to mypage_path
    @end_user = EndUser.find(params[:id])
    @sweets_revues = @end_user.sweets_revues
  end

  def mypage
    @end_user = current_end_user
    @sweets_revues = SweetsRevue.all.page(params[:page])
    # @sweets_revues = @end_user.sweets_revues.all
  end

  def index
    @end_users = EndUser.all
  end


  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to "/end_users/my_page"
      flash[:notice] = "会員情報が更新されました。"
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  #下記は退会確認画面用
  def withdraw
      # @customer_is_deleted = current_customer
      # if @customer_is_deleted.update(params[:is_deleted][:true])
        # redirect_to root_path
      @end_user = current_end_user
      # is_deletedカラムをtrueに変更することにより削除フラグを立てる
      @end_user.update(user_status: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
  end


  def confirm
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :nickname, :introduction, :profile_image)
  end

end
