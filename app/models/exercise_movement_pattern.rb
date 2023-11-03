class ExerciseMovementPattern < ApplicationRecord
  belongs_to :exercise
  belongs_to :movement_pattern
  validates :movement_pattern_id, uniqueness: { scope: :exercise_id }
end
