class League
  include Mongoid::Document
  field :name, type: String
  field :alias, type: String

  embeds_many :conferences
  embedded_in :category
end
