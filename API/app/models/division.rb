class Division < ApplicationRecord
  self.primary_key = :alias

  belongs_to :conference, foreign_key: 'conference_alias'
  has_many :teams, foreign_key: 'division_alias'
end
