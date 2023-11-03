class ExerciseMuscle < ApplicationRecord
  belongs_to :exercise
  belongs_to :muscle
  validates :muscle_id, uniqueness: { scope: :exercise_id }
end
