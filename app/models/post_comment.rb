class PostComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :sweets_revue

  validates :comment, presence: true
end
