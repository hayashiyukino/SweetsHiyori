class RevueTagRelation < ApplicationRecord
  belongs_to :sweets_revue
  belongs_to :tag
end
