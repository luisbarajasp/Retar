class Score < ApplicationRecord
  has_many :periods
  belongs_to :game
end
