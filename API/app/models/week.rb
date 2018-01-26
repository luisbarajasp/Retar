class Week < ApplicationRecord
  self.primary_key = "id"

  has_many :games
  belongs_to :season
end
