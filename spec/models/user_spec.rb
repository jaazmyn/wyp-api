require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid name" do
    user = User.new(name: "test", email: "test@test.com")
    expect(user.name).to eq("test")
  end

  it "has a valid email" do
    user = User.new(email: "test@test.com")
    expect(user.email).to eq("test@test.com")
  end

  it "has many plants" do
    user = User.new(email: "test@test.com")
    expect(user).to respond_to(:plants)
    expect(user.plants.count).to eq(0)
  end

  it "should destroy child plants and watering_events when destroying self" do
    user = User.create!(name: "test", email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user, watering_interval: 10, fertilizing_interval: 15)
    expect { user.destroy }.to change { user.plants.count }.from(1).to(0)
  end
end

