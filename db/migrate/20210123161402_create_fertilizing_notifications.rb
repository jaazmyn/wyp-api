class CreateFertilizingNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :fertilizing_notifications do |t|
      t.references :plant, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
