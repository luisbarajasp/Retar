class Venue < ApplicationRecord
    self.primary_key = :id
    has_many :games
end
