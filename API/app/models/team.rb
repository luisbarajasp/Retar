class Team
  include Mongoid::Document
  field :name, type: String
  field :market, type: String
  field :alias, type: String
  field :references, type: Hash

  has_one :venue
  belongs_to :division
end
