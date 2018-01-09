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

  def serializable_hash(options={})
    {
      id: id,
      status: status,
      number: number,
      scheduled: scheduled,
      attendance: attendance,
      weather: weather,
      winner_id: winner_id,
      current_period: current_period,
      clock: clock,
      teams: {
        home: {
          id: home.id,
          code: home.code,
          division_id: home.division_id,
          market: home.market,
          name: home.name,
        },
        away: {
          id: away.id,
          code: away.code,
          division_id: away.division_id,
          market: away.market,
          name: away.name,
        },       
      },
      venue: venue.serializable_hash,      
      score: score.serializable_hash
    }
  end
end
