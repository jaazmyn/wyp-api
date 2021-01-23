# frozen_string_literal: true

class WateringEvent < ApplicationRecord
  belongs_to :plant

  validates :date, presence: true
end
