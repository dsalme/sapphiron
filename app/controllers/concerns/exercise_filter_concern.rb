# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseFilterConcern
  extend ActiveSupport::Concern

  included do
  end
  FILTER_PARAMS = {
    tool_id: { model: Tool, association: :tools },
    muscle_id: { model: Muscle, association: :muscles },
    movement_pattern_id: { model: MovementPattern, association: :movement_patterns }
  }.freeze
end
