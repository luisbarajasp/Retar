class AuthenticationToken < ApplicationRecord
  before_create :generate_token

  attribute :token
  attr_encrypted :token, key: ENV['TOKEN_ENCRYPTION_KEY']
  blind_index :token, key: ENV["TOKEN_BLIND_INDEX_KEY"]

  ## Relations
  belongs_to :user, foreign_key: 'user_username'

  private 
  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.where(token: token).exists?
  end
end
