class Reto
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :winner, type: Integer
  field :retador_pick, type: Integer # 0: home, 1: away
  field :maximum_to, type: Integer, default: ->{ 1 }
  field :bet, type: Float
  field :scheduled, type: DateTime
  field :duration, type: Integer # in seconds
  field :began_at, type: DateTime
  field :status, type: String, default: ->{ "scheduled" }

  belongs_to :retador, class_name: 'User', inverse_of: :done_retos
  belongs_to :judge, class_name: 'User', inverse_of: :judging_retos, optional: true
  belongs_to :game, optional: true
  has_many :retados, dependent: :destroy

  # TODO: validate that the users are friends
  
  before_save :set_began_date
  after_save :check_response

  private
  def set_began_date
    if self.status_changed? && self.status == "inprogress"
      self.began_at = Time.now
    end
  end
  def check_response
    if self.status == "inprogress"
      self.retados.where(status: 0) do |r|
        r.status = 3
      end
    end
  end
end
