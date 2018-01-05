class Sport
  include Mongoid::Document
  field :name, type: String

  embeds_many :leagues
end
