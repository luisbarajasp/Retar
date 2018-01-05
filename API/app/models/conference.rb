class Conference
  include Mongoid::Document
  field :_id, type: String, default: ->{ code }
  field :name, type: String, default: 'Default'
  field :code, type: String, default: 'def'

  embeds_many :divisions
  embedded_in :league
end
