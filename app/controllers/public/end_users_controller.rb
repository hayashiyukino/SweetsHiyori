class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(params[:id])
    @sweets_revues = @end_user.sweets_revues.all.page(params[:page]).per(5).order(created_at: :desc)
  end

  def mypage
    @end_user = current_end_user
    @sweets_revues = @end_user.sweets_revues.all.page(params[:page]).per(5).order(created_at: :desc)

  end

  def index
    @end_users = EndUser.all.page(params[:page]).per(15)
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
    @end_user = current_end_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  # def confirm
  # end

  private

  def end_user_params
    params.require(:end_user).permit(
      :name, :nickname, :introduction, :user_status, :profile_image
    )
  end

end
