# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseMovementPatternsConcern
  extend ActiveSupport::Concern

  included do
    private

    # movement patterns assignment
    def create_or_delete_exercise_movement_patterns(exercise, movement_pattern_ids)
      exercise.exercise_movement_patterns.destroy_all
      movement_pattern_ids.each do |movement_pattern|
        if !movement_pattern.nil? && !movement_pattern.empty?
          exercise.movement_patterns << MovementPattern.find(movement_pattern)
        end
      end
    end
  end
end
