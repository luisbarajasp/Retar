class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues, id: false, force: true do |t|
      t.string :alias, null: false, default: ""
      t.string :name
      t.string :category_country_code, foreign_key: true

      t.timestamps
    end
    add_index :leagues, :alias, unique: true
  end
end
