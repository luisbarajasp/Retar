class Week
  include Mongoid::Document
  field :number, type: Integer

  embedded_in :season
  has_many :games
end
