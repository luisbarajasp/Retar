class Team < ApplicationRecord
    self.primary_key = :id
    has_many :home_games, class_name: "Game", foreign_key: "home_id"
    has_many :away_games, class_name: "Game", foreign_key: "away_id"

    protected
    def games
        Game.where("home_id = ? OR away_id = ?", self.id, self.id)
    end
end
