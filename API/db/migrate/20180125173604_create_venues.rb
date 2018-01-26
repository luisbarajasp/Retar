class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues, id: false, force: true do |t|
      t.string :id, null: false, default: ""
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :address
      t.string :map_coordinates
      t.integer :capacity
      t.string :surface
      t.string :roof_type
      t.string :team_id, foreign_key: true

      t.timestamps
    end
    add_index :venues, :id, unique: true
  end
end
