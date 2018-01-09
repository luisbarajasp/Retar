class Score
  include Mongoid::Document
  field :home_points, type: Integer
  field :away_points, type: Integer

  embeds_many :periods
  embedded_in :game

  after_save :set_winner

  def set_winner
    if(self.game.status == 'finished' || self.game.status == 'completed' || self.game.status == 'closed')
      if(self.home_points > self.away_points)
        self.game.update(:winner_id => self.game.home_id)
      elsif(self.away_points > self.home_points)
        self.game.update(:winner_id => self.game.away_id)
      end
    end
  end
end
