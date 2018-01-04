class Score < ApplicationRecord
    belongs_to :game
    has_many :periods
end
