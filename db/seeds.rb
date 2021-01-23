# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'httparty'
require "faker"

puts "Destroying users.."
User.destroy_all

puts "Destroying plants..."
Plant.destroy_all

puts "Destroying watering events.."
WateringEvent.destroy_all

puts "Destroying fertilizing events events.."
FertilizingEvent.destroy_all

puts "Destroying water notifications..."
WateringNotification.destroy_all

puts "Destroying fertilize notifications..."
FertilizingNotification.destroy_all

user = User.create!(name: "jasmin", email: "jasmin@test.com", password: "123456")

response = HTTParty.get(
  'https://trefle.io/api/v1/plants', format: :plain,
  query: {
    "token": ""
  }
)

plants = JSON.parse(response, symbolize_names: true)

plants[:data].each do |plant_info|

    plant = Plant.create!(
      name: plant_info[:common_name],
      watering_interval: 7,
      fertilizing_interval: 7,
      user: user
    )

  1.times do
    watering_event = WateringEvent.new(
      date: Date.today,
      plant: plant,
      note: "One glass of water"
      )
    watering_event.save!
  end

  1.times do
    fertilizing_event = FertilizingEvent.new(
      date: Date.today,
      plant: plant
      )
    fertilizing_event.save!
  end

  puts "Saving #{plant.name}..."
end