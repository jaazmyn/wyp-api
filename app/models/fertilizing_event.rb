# frozen_string_literal: true

class FertilizingEvent < ApplicationRecord
  belongs_to :plant

  validates :date, presence: true
end
