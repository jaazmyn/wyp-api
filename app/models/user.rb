# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plants, dependent: :destroy
  has_many :watering_events, through: :plants, dependent: :destroy
  has_many :fertilizing_events, through: :plants, dependent: :destroy
  has_many :fertilizing_notifications, through: :plants, dependent: :destroy
  has_many :watering_notifications, through: :plants, dependent: :destroy
end
