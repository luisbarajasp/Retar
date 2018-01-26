class Score < ApplicationRecord
  has_many :periods
  belongs_to :game

  after_save :set_winner

  private
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
