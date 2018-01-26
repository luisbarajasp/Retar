class Category < ApplicationRecord
  self.primary_key = :country_code

  has_many :leagues, foreign_key: 'category_country_code'
  belongs_to :sport, foreign_key: 'sport_name'
end
