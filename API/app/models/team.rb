class Team
  include Mongoid::Document
  field :name, type: String
  field :market, type: String
  field :code, type: String

  has_one :venue
  belongs_to :division

  has_many :home_games, class_name: 'Game', foreign_key: 'home_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_id'

  def games
    
  end
end
