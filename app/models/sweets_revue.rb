class SweetsRevue < ApplicationRecord
  ## アソシエーション
  # ユーザー
  belongs_to :end_user
  # ジャンル
  belongs_to :genre
  # タグとの中間テーブル
  has_many :revue_tag_relations, dependent: :destroy
    # 関連項目も含めて一度に保存、削除する
    accepts_nested_attributes_for :revue_tag_relations, allow_destroy: true
  # 中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :revue_tag_relations
  # 投稿へのコメント
  has_many :post_comments, dependent: :destroy
  # 投稿へのいいね
  has_many :favorites, dependent: :destroy
   # 引数のend_userにはend_userのidの値が入る
   # 投稿一覧ページでこのコードがあるためログイン前（ユーザーidを持っていない）時に一覧ページに遷移しようとするとエラーになる
   def favorited_by?(end_user)
     # その為if文で引数のend_user(= end_user.id)がblank?(= なければ）returnするとするとこれ以降の処理が行われない
     if end_user.blank?
       return false
     end
     # end_userに値が入っていたらこちらの処理が行われる
     # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ存在していればtrue、存在していなければfalseを返す
     favorites.where(end_user_id: end_user.id).exists?
    # favorites.exists?(end_user_id: end_user.id)
   end


  ##画像保存
  has_one_attached :sweets_image

  def get_sweets_image(width, height)
    unless sweets_image.attached?
      file_path = Rails.root.join('app/assets/images/no_sweets_image.jpg')
      sweets_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    sweets_image.variant(resize_to_limit: [width, height]).processed
  end

  ## バリデーション
    validates :sweets_name, presence: true
    validates :tax_included_price, presence: true
    validates :review_star, presence: true

end
