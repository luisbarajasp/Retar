class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams, id: false, force: true do |t|
      t.string :id, null: false
      t.string :name
      t.string :alias
      
      t.timestamps
    end
    add_index :teams, :id, unique: true
  end
end
