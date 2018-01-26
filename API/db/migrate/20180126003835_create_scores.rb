class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :home_points
      t.integer :away_points
      t.string :game_id

      t.timestamps
    end
  end
end
