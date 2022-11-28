class Genre < ApplicationRecord
  has_many :sweets_revues, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
