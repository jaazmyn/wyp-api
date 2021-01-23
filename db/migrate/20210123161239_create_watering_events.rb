class CreateWateringEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :watering_events do |t|
      t.date :date
      t.string :note
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
