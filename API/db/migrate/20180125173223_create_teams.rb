class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams, id: false, force: true do |t|
      t.string :id, null: false, default: ""
      t.string :name
      t.string :market
      t.string :alias
      t.string :division_alias, foreign_key: true

      t.timestamps
    end
    add_index :teams, :id, unique: true
  end
end
