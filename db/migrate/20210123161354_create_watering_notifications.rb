# frozen_string_literal: true

class CreateWateringNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :watering_notifications do |t|
      t.references :plant, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
