class AddBlindIndexToAuthenticationTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :authentication_tokens, :encrypted_token_iv, :string
    add_column :authentication_tokens, :encrypted_token_bidx, :text
    add_index :authentication_tokens, :encrypted_token_bidx
  end
end
