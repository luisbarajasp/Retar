class Conference
  include Mongoid::Document
  field :name, type: String, default: 'Default'
  field :alias, type: String

  embeds_many :divisions
  embedded_in :league
end
