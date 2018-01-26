class Season < ApplicationRecord
  self.primary_key = "id"
  # disable STI
  self.inheritance_column = :_type_disabled

  belongs_to :league
  has_many :weeks
end
