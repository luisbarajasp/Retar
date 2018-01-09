class Season
  include Mongoid::Document
  field :_id, type: String
  field :name, type: String
  field :type, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :year, type: String

  embeds_many :weeks
  embedded_in :league
end
