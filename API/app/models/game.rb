class Game < ApplicationRecord
  self.primary_key = "id"
  
  belongs_to :week
  belongs_to :home, class_name: 'Team', inverse_of: :home_games
  belongs_to :away, class_name: 'Team', inverse_of: :away_games
  belongs_to :venue
  
  has_one :score

  has_many :retos
end
