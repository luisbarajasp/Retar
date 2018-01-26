class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks, id: false, force: true do |t|
      t.string :id, null: false, default: ""
      t.string :title
      t.integer :sequence
      t.string :season_id

      t.timestamps
    end
    add_index :weeks, :id, unique: true
  end
end
