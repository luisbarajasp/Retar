class CreateRetos < ActiveRecord::Migration[5.1]
  def change
    create_table :retos do |t|
      t.text :description
      t.integer :winner
      t.integer :retador_pick
      t.integer :maximum_to, default: 1
      t.decimal :bet
      t.datetime :scheduled
      t.integer :duration
      t.datetime :began_at
      t.string :status, default: "scheduled"
      t.string :retador_username
      t.string :judge_username
      t.string :game_id

      t.timestamps
    end
  end
end
