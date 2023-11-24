# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseMusclesConcern
  extend ActiveSupport::Concern

  included do
    private

    # muscles assignment
    def create_or_delete_exercise_muscles(exercise, muscle_ids)
      exercise.exercise_muscles.destroy_all
      muscle_ids.each do |muscle|
        exercise.muscles << Muscle.find(muscle) if !muscle.nil? && !muscle.empty?
      end
    end
  end
end
