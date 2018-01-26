class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :status, default: 0
      t.string :reference
      t.string :user_username
      t.string :friend_username

      t.timestamps
    end
  end
end
