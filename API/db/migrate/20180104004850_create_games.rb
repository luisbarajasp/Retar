class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games, id: false, force: true do |t|
      t.string :id, null: false
      t.string :status
      t.string :reference
      t.integer :number
      t.datetime :scheduled
      t.integer :attendance
      t.integer :utc_offset
      t.string :entry_mode
      t.text :weather
      t.string :broadcast
      t.string :venue_id, foreign_key:true
      t.string :home_id, foreign_key:true
      t.string :away_id, foreign_key:true
      
      t.timestamps
    end
    add_index :games, :id, unique: true
  end
end
