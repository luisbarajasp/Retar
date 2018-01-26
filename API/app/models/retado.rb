class Retado < ApplicationRecord
  belongs_to :reto
  belongs_to :user, inverse_of: :being_retados, foreign_key: 'user_username'

  before_create :validate_friendship

  private
  def validate_friendship
    unless reto.retador.is_friend_with? user
      throw(:abort)
    end
  end
end
