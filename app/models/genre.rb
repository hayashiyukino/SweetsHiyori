class Genre < ApplicationRecord
  has_many :sweets_revues, dependent: :destroy

  validates :name, uniqueness: true
end
