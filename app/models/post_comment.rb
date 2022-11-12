class PostComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :sweets_revue
end
