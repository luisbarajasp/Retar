class Friendship < ApplicationRecord
  #status - 0: pending, 1: accepted, 2: declined

  belongs_to :user, inverse_of: :friendships, foreign_key: 'user_username'
  belongs_to :friend, :class_name => "User", inverse_of: :inverse_friendships, foreign_key: 'friend_username'

  before_validation :generate_reference

  validates :reference, presence: :true, uniqueness: { case_sensitive: false }

  private
  # Create a unique reference to the friendship so it can not be sent again
  def generate_reference
    a = []
    a << self.user_username
    a << self.friend_username
    
    self.reference ||= a.sort.join("")
    #throw(:abort)
  end
end
