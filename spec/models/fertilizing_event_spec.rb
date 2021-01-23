# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FertilizingEvent, type: :model do
  it "has a date" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user)
    fertilizing_event = FertilizingEvent.new(date: Date.today - 10, plant: plant)
    expect(fertilizing_event.date).to eq(Date.today - 10)
  end

  it "has a note" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user)
    fertilizing_event = FertilizingEvent.new(date: Date.today - 10, note: "one glass of water", plant: plant)
    expect(fertilizing_event.note).to eq("one glass of water")
  end

  it "belongs to a plant" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    fertilizing_event = FertilizingEvent.create!(plant: plant, date: Date.today)
    expect(fertilizing_event.plant).to eq(plant)
  end
end
