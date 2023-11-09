class CreateExerciseTools < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_tools do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
