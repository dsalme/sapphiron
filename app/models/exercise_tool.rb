class ExerciseTool < ApplicationRecord
  belongs_to :exercise
  belongs_to :tool
  validates :tool_id, uniqueness: { scope: :exercise_id }
end
