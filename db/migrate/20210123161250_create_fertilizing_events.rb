# frozen_string_literal: true

class CreateFertilizingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :fertilizing_events do |t|
      t.date :date
      t.string :note
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
