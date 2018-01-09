class Game
  include Mongoid::Document
  field :_id, type: String
  field :status, type: String
  field :number, type: Integer
  field :scheduled, type: DateTime
  field :attendance, type: Integer
  field :weather, type: String
  field :winner_id, type: String
  field :current_period, type: String
  field :clock, type: Integer


  belongs_to :week
  belongs_to :home, class_name: 'Team', inverse_of: :home_games
  belongs_to :away, class_name: 'Team', inverse_of: :away_games
  belongs_to :venue
  
  embeds_one :score
end
