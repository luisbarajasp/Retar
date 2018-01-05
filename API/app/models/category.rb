class Category
  include Mongoid::Document
  field :name, type: String
  field :country_code, type: String

  embeds_many :leagues
  embedded_in :sport
end
