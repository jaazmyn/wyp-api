# frozen_string_literal: true

class Plant < ApplicationRecord
  belongs_to :user

  has_many :watering_events, dependent: :destroy
  has_many :fertilizing_events, dependent: :destroy
  has_many :fertilizing_notifications, dependent: :destroy
  has_many :watering_notifications, dependent: :destroy
end
