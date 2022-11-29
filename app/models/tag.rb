class Tag < ApplicationRecord
  has_many :revue_tag_relations, dependent: :destroy
  # 中間テーブルを介してSweetsRevueテーブルへの関連付け
  has_many :sweets_revues, through: :revue_tag_relations

  validates :name, presence: true, uniqueness: true
end
