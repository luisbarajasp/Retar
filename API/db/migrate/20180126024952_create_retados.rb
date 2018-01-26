class CreateRetados < ActiveRecord::Migration[5.1]
  def change
    create_table :retados do |t|
      t.integer :status, default: 0
      t.references :reto, foreign_key: true
      t.string :user_username

      t.timestamps
    end
  end
end
