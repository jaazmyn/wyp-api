# frozen_string_literal: true

class WateringNotification < ApplicationRecord
  belongs_to :plant

  validates :date, presence: true
end
