class RevueTagRelation < ApplicationRecord
  belongs_to :sweets_revue, optional: true
  belongs_to :tag
  
end
