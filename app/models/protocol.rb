class Protocol < ApplicationRecord
  MEASURE_OPTIONS = { time: 0, sets: 1 }.freeze
  enum :measure_unit, MEASURE_OPTIONS, validate: true
  has_many :blocks, dependent: :restrict_with_exception
  validates :name, uniqueness: true, presence: true
end
