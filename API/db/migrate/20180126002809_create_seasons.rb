class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons, id: false, force: true do |t|
      t.string :id, null: false, default: ""
      t.string :name
      t.string :type
      t.date :start_date
      t.date :end_date
      t.string :year
      t.string :league_alias

      t.timestamps
    end
    add_index :seasons, :id, unique: true
  end
end
