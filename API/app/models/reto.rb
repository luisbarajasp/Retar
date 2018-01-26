class Reto < ApplicationRecord
  belongs_to :retador, class_name: 'User', inverse_of: :done_retos, foreign_key: 'retador_username'
  belongs_to :judge, class_name: 'User', inverse_of: :judging_retos, optional: true, foreign_key: 'judge_username'
  belongs_to :game, optional: true
  has_many :retados, dependent: :destroy

  before_save :set_began_date
  # after_save :check_response

  private
  def set_began_date
    if self.status_changed? && self.status == "inprogress"
      self.began_at = Time.now
    end
  end
  # def check_response
  #   if self.status == "inprogress"
  #     self.retados.where(status: 0) do |r|
  #       r.status = 3
  #     end
  #   end
  # end
end
