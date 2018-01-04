class CreatePeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :periods, id: false, force: true do |t|
      t.string :id, null: false
      t.string :period_type
      t.integer :number
      t.integer :sequence
      t.integer :home_points
      t.integer :away_points
      t.references :score, foreign_key:true, index: true

      t.timestamps
    end
    add_index :periods, :id, unique: true
  end
end
