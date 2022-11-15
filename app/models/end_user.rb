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
  has_one_attached :profile_image
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  ## フォローをした
  # relationships = 分かりやすいように名前をつけただけ
  # class_name: "Relationship"でRelationshipテーブルを参照
  # foreign_key(外侮キー)で参照するカラムを指定
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  ## フォローされた
  # reverse_of_relationships = 分かりやすいように名前をつけただけ
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  ## 一覧画面で使う
  #  フォロー・フォロワーの一覧画面で、user.followersという記述でフォロワーを表示したいので、
  #  throughでスルーするテーブル、sourceで参照するカラムを指定。
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローしたときの処理の定義
  def follow(end_user_id)
    relationships.create(followed_id: end_user_id)
  end
  # フォローを外すときの処理の定義
  def unfollow(end_user_id)
    relationships.find_by(followed_id: end_user_id).destroy
  end
  # フォローしているか判定
  def following?(end_user)
    followings.include?(end_user)
  end

  ## バリデーション
  validates :nickname, uniqueness: true
  validates :introduction, length: { maximum: 50 }

end
