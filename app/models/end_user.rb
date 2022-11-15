class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:nickname]  #ログイン認証のキーをニックネームへ
  ## アソシエーション
  has_many :sweets_revues
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :
  # has_many :

  ## 画像投稿出来るようにする
  has_one_attached :image

end
