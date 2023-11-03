class CreateExerciseMuscles < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_muscles do |t|
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :muscle, null: false, foreign_key: true
      t.integer :predominance

      t.timestamps
    end
  end
end
