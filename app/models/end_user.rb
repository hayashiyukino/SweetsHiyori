class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # :authentication_keys => [:nickname]  #認証のキーをメールから名前へ
  # 画像投稿出来るようにする     
  has_one_attached :image
         
  # validates_uniqueness_of :nickname
  # validates_presence_of :nickname
  
  # ##nicknameを利用してログイン
  # #find_first_by_auth_conditions=認証時にユーザーを特定する為に通るメソッド
  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["nickname = :value", { :value => nickname}]).first
  #   else
  #     where(conditions).first
  #   end
  # end
  
  # # 登録時にemailを不要にする
  # def email_required?
  #   false
  # end
  
  # def email_changed?
  #   false
  # end
end
