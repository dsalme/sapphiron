# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseMusclesConcern
  extend ActiveSupport::Concern

  included do
    private

    # muscles assignment
    def create_or_delete_exercise_muscles(exercise, muscle_ids, predominances)
      exercise.exercise_muscles.destroy_all
      muscle_ids.each do |muscle|
        next unless !muscle.nil? && !muscle.empty?

        exercise.exercise_muscles << ExerciseMuscle.create!(
          muscle: Muscle.find(muscle),
          exercise:,
          predominance: predominances[muscle]
        )
      end
    end
  end
end
