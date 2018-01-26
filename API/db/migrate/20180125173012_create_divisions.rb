class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions, id: false, force: true do |t|
      t.string :alias, null: false, default: ""
      t.string :name
      t.string :conference_alias, foreign_key: true

      t.timestamps
    end
    add_index :divisions, :alias, unique: true
  end
end
