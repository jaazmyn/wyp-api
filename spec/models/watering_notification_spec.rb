# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WateringNotification, type: :model do
  it "has a date" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user)
    watering_notification = WateringNotification.new(date: Date.today - 10)
    expect(watering_notification.date).to eq(Date.today - 10)
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    watering_notification = WateringNotification.create!(plant: plant, date: Date.today)
    expect(watering_notification.plant).to eq(plant)
  end
end
