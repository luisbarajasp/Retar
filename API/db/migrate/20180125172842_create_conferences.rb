class CreateConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :conferences, id: false, force: true do |t|
      t.string :alias, null: false, default: ""
      t.string :name
      t.string :league_alias, foreign_key: true

      t.timestamps
    end
    add_index :conferences, :alias, unique: true
  end
end
