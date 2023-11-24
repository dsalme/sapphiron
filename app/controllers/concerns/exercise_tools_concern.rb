# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseToolsConcern
  extend ActiveSupport::Concern

  included do
    private

    # tools assignment
    def create_or_delete_exercise_tools(exercise, tool_ids)
      exercise.exercise_tools.destroy_all
      tool_ids.each do |tool|
        exercise.tools << Tool.find(tool) if !tool.nil? && !tool.empty?
      end
    end
  end
end
