class Period < ApplicationRecord
    self.primary_key = :id
    belongs_to :score
end
