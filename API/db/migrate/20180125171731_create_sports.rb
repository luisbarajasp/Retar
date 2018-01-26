class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports, id: false, force: true do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
    add_index :sports, :name, unique: true
  end
end
