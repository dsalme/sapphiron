class MovementPattern < ApplicationRecord
    has_many :exercise_movement_patterns, dependent: :destroy
    has_many :exercises, through: :exercise_movement_patterns
    validates :name, uniqueness: true, presence: true
end
