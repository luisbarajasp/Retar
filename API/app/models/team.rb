class Team < ApplicationRecord
  self.primary_key = "id"
  
  has_one :venue
  belongs_to :division, foreign_key: 'division_alias'

  has_many :home_games, class_name: 'Game', foreign_key: 'home_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_id'
end
