class RevueTagRelation < ApplicationRecord
  belongs_to :sweets_revue, optional: true
  belongs_to :tag
  
  #念のためバリデーション
  #validates :sweets_revue_id, presence: true
  #validates :tag_id, presence: true
end
