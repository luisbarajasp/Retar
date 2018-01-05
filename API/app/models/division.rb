class Division
  include Mongoid::Document
  field :_id, type: String, default: ->{ code }
  field :name, type: String, default: 'Default'
  field :code, type: String, default: 'def'

  has_many :teams
  embedded_in :conference
end
