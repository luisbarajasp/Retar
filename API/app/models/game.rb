class Game < ApplicationRecord
  self.primary_key = "id"
  
  belongs_to :week
  belongs_to :home, class_name: 'Team', inverse_of: :home_games
  belongs_to :away, class_name: 'Team', inverse_of: :away_games
  belongs_to :venue
  
  has_one :score

  has_many :retos

  after_save :update_retos

  private
  def update_retos
    ## Update timings and statuses    
    if self.saved_change_to_status? 
      if self.status == "inprogress"

        retos.update_all status: "inprogress"

      elsif self.status == "finished" || self.status == "complete" || self.status == "closed"

        if(self.score.home_points > self.score.away_points)
          self.winner_id = self.home_id
          retos.update_all status: "finished", winner: self.home_id         
        elsif(self.score.away_points > self.score.home_points)
          self.winner_id = self.away_id
          retos.update_all status: "finished", winner: self.away_id   
        end

      elsif self.status == "postponed"

        # TODO: think a way to retreived the new game
        # Game.where(home_id: "4809ecb0-abd3-451d-9c4a-92a90b83ca06").where(away_id: "4254d319-1bc7-4f81-b4ab-b5e6f3402b69")    

      elsif self.status == "delayed" && self.saved_change_to_scheduled? 

        retos.update_all scheduled_at: self.scheduled

      end
    end
  end
end
