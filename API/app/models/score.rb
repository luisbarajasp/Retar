class Score
  include Mongoid::Document
  field :home_points, type: Integer
  field :away_points, type: Integer

  embeds_many :periods
  embedded_in :game
end
