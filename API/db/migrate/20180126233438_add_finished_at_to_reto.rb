class AddFinishedAtToReto < ActiveRecord::Migration[5.1]
  def change
    add_column :retos, :finished_at, :datetime
    rename_column :retos, :scheduled, :scheduled_at
    change_column :retos, :winner, :string
  end
end
