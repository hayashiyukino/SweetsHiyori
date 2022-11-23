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
  
  # 退会済みのユーザーがログインできない制約
  # is_deleteがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end

  ## 画像投稿出来るようにする
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
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
  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 100 }

end
