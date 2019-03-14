class Hero < ApplicationRecord
  validates :slug, uniqueness: true
  self.per_page = 10
end
