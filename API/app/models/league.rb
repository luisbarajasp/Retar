class League
  include Mongoid::Document
  field :_id, type: String, default: ->{ code }
  field :name, type: String
  field :code, type: String

  embeds_many :seasons
  embeds_many :conferences  
  embedded_in :category
end
