# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params,  if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  protected

    # 退会しているかを判断するメソッド
  def end_user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
      ## 【処理内容3】
    end
  end

  def reject_user
    # 入力されたnicknameからアカウントを1件取得
    @end_user = EndUser.find_by(name: params[:end_user][:nickname])
      #アカウントが取得出来たら次の処理をする
      if @end_user
        # 入力されたパスワードが正しいか確認 & @end_userのactive_for_authentication?を判断
        if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.is_deleted == false)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
          redirect_to root_path
        else
          flash[:notice] = "項目を入力してください"
        end
      end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  # end

  # def after_sign_up_path_for(resource)
  #   mypage_path(resource)
  # end

  def after_sign_in_path_for(resource)
    mypage_path(resource)
  end
end
