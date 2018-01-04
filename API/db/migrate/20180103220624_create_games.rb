class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games id: false, force: true do |t|
      t.string :id, null: false

      t.timestamps
    end
    add_index :games, :id, unique: true
  end
end
