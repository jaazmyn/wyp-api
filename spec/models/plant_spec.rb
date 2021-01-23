# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plant, type: :model do
  it "has a name" do
    plant = Plant.new(name: "Monstera")
    expect(plant.name).to eq("Monstera")
  end

  it "has a description" do
    plant = Plant.new(description: "easy going")
    expect(plant.description).to eq("easy going")
  end

  it "has a watering interval" do
    plant = Plant.new(watering_interval: 10)
    expect(plant.watering_interval).to eq(10)
  end

  it "watering interval can not be blank" do
    plant = Plant.new(watering_interval: "")
    expect(plant).to_not be_valid
  end

  it "has many watering events" do
    plant = Plant.new(name: "Monstera")
    expect(plant).to respond_to(:watering_events)
    expect(plant.watering_events.count).to eq(0)
  end

  it "has many fertilizing events" do
    plant = Plant.new(name: "Monstera")
    expect(plant).to respond_to(:fertilizing_events)
    expect(plant.fertilizing_events.count).to eq(0)
  end

  it "has many fertilizing notifications" do
    plant = Plant.new(name: "Monstera")
    expect(plant).to respond_to(:fertilizing_notifications)
    expect(plant.fertilizing_notifications.count).to eq(0)
  end

  it "has many watering notifications" do
    plant = Plant.new(name: "Monstera")
    expect(plant).to respond_to(:watering_notifications)
    expect(plant.watering_notifications.count).to eq(0)
  end

  it "belongs to a user" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.new(name: "Monstera", user: user)
    expect(plant.user).to eq(user)
  end

  it "should destroy child watering events when destroying self" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    WateringEvent.create!(date: Date.today, plant: plant)
    expect { plant.destroy }.to change { plant.watering_events.count }.from(1).to(0)
  end

  it "should destroy child fertilizing events when destroying self" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    FertilizingEvent.create!(date: Date.today, plant: plant)
    expect { plant.destroy }.to change { plant.fertilizing_events.count }.from(1).to(0)
  end

  it "should destroy child fertilizing notifications when destroying self" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    FertilizingNotification.create!(date: Date.today, plant: plant)
    expect { plant.destroy }.to change { plant.fertilizing_notifications.count }.from(1).to(0)
  end

  it "should destroy child watering notifications when destroying self" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10)
    WateringNotification.create!(date: Date.today, plant: plant)
    expect { plant.destroy }.to change { plant.watering_notifications.count }.from(1).to(0)
  end
end
