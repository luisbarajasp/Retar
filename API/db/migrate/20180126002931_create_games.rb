class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games, id: false, force: true do |t|
      t.string :id, null: false, default: ""
      t.string :status
      t.integer :number
      t.datetime :scheduled
      t.integer :attendance
      t.text :weather
      t.string :winner_id
      t.string :current_period
      t.integer :clock
      t.string :week_id
      t.string :home_id
      t.string :away_id
      t.string :venue_id

      t.timestamps
    end
    add_index :games, :id, unique: true
  end
end
