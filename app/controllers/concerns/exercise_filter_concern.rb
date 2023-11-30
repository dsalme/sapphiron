# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseFilterConcern
  extend ActiveSupport::Concern

  included do
  end
  FILTER_PARAMS = {
    tool_id: { model: Tool, association: :tools, field: :id },
    muscle_id: { model: Muscle, association: :muscles, field: :id },
    muscle_group_id: { model: Muscle, association: :muscles, field: :muscle_group_id },
    movement_pattern_id: { model: MovementPattern, association: :movement_patterns, field: :id }
  }.freeze
end
