class CreateAuthenticationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_tokens do |t|
      t.string :encrypted_token
      t.string :fb_token
      t.string :user_username

      t.timestamps
    end
  end
end
