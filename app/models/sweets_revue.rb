class SweetsRevue < ApplicationRecord
  belongs_to :end_user
  belongs_to :genre
  has_many :revue_tag_relations, dependent: :destroy
  # 中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :revue_tag_relations, dependent: :destroy
  has_many :posuto_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
