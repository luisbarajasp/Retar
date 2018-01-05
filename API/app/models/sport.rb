class Sport
  include Mongoid::Document
  field :_id, type: String, default: ->{ name }
  field :name, type: String

  embeds_many :categories
end
