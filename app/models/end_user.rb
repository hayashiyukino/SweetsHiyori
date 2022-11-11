class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #認証のキーをメールから名前へ
         :authentication_keys => [:nickname] 
         
  validates_uniqueness_of :nickname
  validates_presence_of :nickname
  
  #nicknameを利用してログイン
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["nickname = :value", { :value => nickname}]).first
    else
      where(conditions).first
    end
  end
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
