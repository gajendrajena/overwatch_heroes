class Hero < ApplicationRecord
  validates :slug, uniqueness: true
end
