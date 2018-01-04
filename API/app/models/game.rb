class Game < ApplicationRecord
    self.primary_key = :id
    belongs_to :venue
    belongs_to :home, class_name: "Team", :foreign_key => 'home_id'
    belongs_to :away, class_name: "Team", :foreign_key => 'away_id'

    has_one :score
end
