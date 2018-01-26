class League < ApplicationRecord
  self.primary_key = :alias

  belongs_to :category, foreign_key: 'category_country_code'
  has_many :conferences, foreign_key: 'league_alias'
  has_many :seasons, foreign_key: 'league_alias'
end
