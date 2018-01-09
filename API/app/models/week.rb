class Week
  include Mongoid::Document
  field :_id, type: String
  field :title, type: String
  field :sequence, type: Integer

  embedded_in :season
  has_many :games
end
