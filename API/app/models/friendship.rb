class Friendship
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pending,  type: Boolean, default: ->{ true }
  field :rejected, type: Boolean, default: ->{ false }
  field :reference, type: String

  belongs_to :user, inverse_of: :friendships
  belongs_to :friend, :class_name => "User", inverse_of: :inverse_friendships

  before_validation :generate_reference

  validates :reference, presence: :true, uniqueness: { case_sensitive: false }

  private
  # Create a unique reference to the friendship so it can not be sent again
  def generate_reference
    a = []
    a << self.user_id
    a << self.friend_id
    
    self.reference = a.sort.join("")
  end
end
