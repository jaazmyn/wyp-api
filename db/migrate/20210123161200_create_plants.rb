# frozen_string_literal: true

class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.integer :watering_interval
      t.references :user, null: false, foreign_key: true
      t.integer :fertilizing_interval

      t.timestamps
    end
  end
end
