class Conference < ApplicationRecord
  self.primary_key = :alias

  belongs_to :league, foreign_key: 'league_alias'
  has_many :divisions, foreign_key: 'conference_alias'
end
