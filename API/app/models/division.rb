class Division
  include Mongoid::Document
  field :name, type: String
  field :alias, type: String

  has_many :teams
  embedded_in :conference
end
