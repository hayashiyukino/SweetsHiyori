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
   def favorited_by?(end_user)
     # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ存在していればtrue、存在していなければfalseを返す
     favorites.exists?(end_user_id: end_user.id)
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


  # def save_tags(tags)

  #   # タグをスペース区切りで分割し配列にする
  #   #   連続した空白も対応するので、最後の“+”がポイント
  #   tag_list = tags.split(/[[:blank:]]+/)

  #   # 自分自身に関連づいたタグを取得する
  #   current_tags = self.tags.pluck(:name)

  #   # (1) 元々自分に紐付いていたタグと投稿されたタグの差分を抽出
  #   #   -- 記事更新時に削除されたタグ
  #   old_tags = current_tags - tag_list

  #   # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
  #   #   -- 新規に追加されたタグ
  #   new_tags = tag_list - current_tags

  #   p current_tags

  #   # tag_mapsテーブルから、(1)のタグを削除
  #   #   tagsテーブルから該当のタグを探し出して削除する
  #   old_tags.each do |old|
  #     # tag_mapsテーブルにあるpost_idとtag_idを削除
  #     #   後続のfind_byでtag_idを検索
  #     self.tags.delete Tag.find_by(name: old)
  #   end

  #   # tagsテーブルから(2)のタグを探して、tag_mapsテーブルにtag_idを追加する
  #   new_tags.each do |new|
  #     # 条件のレコードを初めの1件を取得し1件もなければ作成する
  #     # find_or_create_by : https://railsdoc.com/page/find_or_create_by
  #     new_post_tag = Tag.find_or_create_by(name: new)

  #     # tag_mapsテーブルにpost_idとtag_idを保存
  #     #   配列追加のようにレコードを渡すことで新規レコード作成が可能
  #     self.tags << new_post_tag
  #   end
  # end
end
