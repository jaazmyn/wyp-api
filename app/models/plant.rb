class Plant < ApplicationRecord
  belongs_to :user

  has_many :watering_events, dependent: :destroy
  has_many :fertilizing_events, dependent: :destroy
  has_many :fertilizer_notifications, dependent: :destroy
  has_many :water_notifications, dependent: :destroy
end
