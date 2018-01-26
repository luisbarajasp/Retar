class Sport < ApplicationRecord
  self.primary_key = :name

  has_many :categories, foreign_key: 'sport_name'
end
