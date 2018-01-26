class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: false, force: true do |t|
      t.string :country_code, null: false, default: ""
      t.string :name
      t.string :sport_name, foreign_key: true

      t.timestamps
    end
    add_index :categories, :country_code, unique: true
  end
end
