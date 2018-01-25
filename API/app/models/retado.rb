class Retado
  include Mongoid::Document
  include Mongoid::Timestamps

  # field :_id, type: String
  field :status, type: Integer, default: ->{ 0 }

  belongs_to :reto
  belongs_to :user, inverse_of: :answered_retos
end
