class CreateExerciseMovementPatterns < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_movement_patterns do |t|
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :movement_pattern, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
