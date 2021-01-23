# frozen_string_literal: true

class FertilizingNotification < ApplicationRecord
  belongs_to :plant
  has_one :user, through: :plant

  validates :date, presence: true
end
