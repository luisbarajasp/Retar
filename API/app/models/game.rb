class Game
  include Mongoid::Document
  field :status, type: String
  field :number, type: Integer
  field :scheduled, type: Date
  field :attendace, type: Integer
  field :weather, type: String
  field :winner_id, type: String
  field :current_period, type: String
  field :clock, type: Integer


  belongs_to :week
  belongs_to :home, class: 'Team', foreign_key: 'home_id'
  belongs_to :away, class: 'Team', foreign_key: 'away_id'
  belongs_to :venue
  
  embeds_one :score
end
