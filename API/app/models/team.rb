class Team
  include Mongoid::Document
  field :name, type: String
  field :market, type: String
  field :code, type: String

  has_one :venue
  belongs_to :division
end
