class Venue < ApplicationRecord
  self.primary_key = "id"

  belongs_to :team, optional: true
  validates :id, uniqueness: true
end
