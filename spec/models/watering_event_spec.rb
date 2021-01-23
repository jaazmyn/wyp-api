# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WateringEvent, type: :model do
  it "has a date" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user)
    watering_event = WateringEvent.new(date: Date.today - 10, plant: plant)
    expect(watering_event.date).to eq(Date.today - 10)
  end

  it "has a note" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user)
    watering_event = WateringEvent.new(date: Date.today - 10, note: "one glass of water", plant: plant)
    expect(watering_event.note).to eq("one glass of water")
  end

  it "belongs to a plant" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    watering_event = WateringEvent.create!(plant: plant, date: Date.today)
    expect(watering_event.plant).to eq(plant)
  end
end
