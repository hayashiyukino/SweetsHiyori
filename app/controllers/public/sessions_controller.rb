# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
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

  def reject_user
    @end_user = EndUser.find_by(name: params[:end_user][:name])
      if @end_user
        if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.is_deleted == false)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
          redirect_to root_path
        else
          flash[:notice] = "項目を入力してください"
        end
      end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end
end
