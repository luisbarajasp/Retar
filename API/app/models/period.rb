class Period
  include Mongoid::Document
  field :_id, type: String
  field :home_points, type: Integer
  field :away_points, type: Integer
  field :type, type: String
  field :number, type: Integer

  embedded_in :score
end
