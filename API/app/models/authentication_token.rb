class AuthenticationToken
  include Mongoid::Document
  include Mongoid::Timestamps

  before_validation :generate_token
  # field :_id, type: String, default: ->{ token }
  field :token, type: String

  ## Validations
  validates :token, uniqueness: true

  ## Relations
  belongs_to :user

  private 
  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.where(token: token).exists?
  end

end
