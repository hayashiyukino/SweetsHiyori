class Genre < ApplicationRecord
  has_many :sweets_revues

  validates :name, uniqueness: true
end
