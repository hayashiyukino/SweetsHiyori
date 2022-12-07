class EndUsers::SessionsController < Devise::SessionsController

  # def new_guest
  #   end_user = EndUser.find_or_create_by(email: 'guest@user.com') do |end_user|
  #   end_user.password = SecureRandom.urlsafe_base64
  #   end_user.name = 'ゲストサンプル'
  #   end_user.nickname = 'ゲスト'
  #   end
  #   sign_in end_user
  #   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  # end

end