# frozen_string_literal: true

# concern for exercises_tool relation creation
module ExerciseFilterConcern
  extend ActiveSupport::Concern

  included do
  end
  FILTER_PARAMS = {
    tool_id: { model: Tool, association: :tools, field: :id },
    tool_name: { model: Tool, association: :tools, field: :name },
    muscle_id: { model: Muscle, association: :muscles, field: :id },
    muscle_name: { model: Muscle, association: :muscles, field: :name },
    muscle_group_id: { model: Muscle, association: :muscles, field: :muscle_group_id },
    movement_pattern_id: { model: MovementPattern, association: :movement_patterns, field: :id },
    movement_pattern_name: { model: MovementPattern, association: :movement_patterns, field: :name }
  }.freeze
end
