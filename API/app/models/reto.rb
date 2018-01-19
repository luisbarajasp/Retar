class Reto
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :winner, type: String
  field :retador_pick, type: Integer # 0: home, 1: away
  field :maximum_to, type: Integer, default: ->{ 1 }
  field :bet, type: Float
  field :scheduled, type: DateTime

  belongs_to :retador, class_name: 'User', inverse_of: :done_retos
  belongs_to :judge, class_name: 'User', inverse_of: :judging_retos, optional: true
  belongs_to :game, optional: true
  has_many :retados, dependent: :destroy

end
