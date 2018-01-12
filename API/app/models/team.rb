class Team
  include Mongoid::Document
  field :name, type: String
  field :market, type: String
  field :code, type: String

  has_one :venue
  belongs_to :division

  has_many :home_games, class_name: 'Game', foreign_key: 'home_id'
  has_many :away_games, class_name: 'Game', foreign_key: 'away_id'

  def serializable_hash(options={})
    options = { 
      :include => :venue,
      :except => [:home_id, :away_id, :games]
    }.update(options)
    hash = super(options)
    hash [:games] = {
      home_games: home_games.inject([]) { |acc, m| acc << m.serializable_hash; acc },
      away_games: away_games.inject([]) { |acc, m| acc << m.serializable_hash; acc }      
    }
    hash
  end
end
