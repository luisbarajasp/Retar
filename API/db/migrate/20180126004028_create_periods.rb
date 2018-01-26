class CreatePeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :periods, id: false, force: true do |t|
      t.string :id, null: false, default: ""
      t.integer :home_points
      t.integer :away_points
      t.string :type
      t.integer :number
      t.references :score, foreign_key: true

      t.timestamps
    end
    add_index :periods, :id, unique: true
  end
end
