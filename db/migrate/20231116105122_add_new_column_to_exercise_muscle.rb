class AddNewColumnToExerciseMuscle < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_muscles, :predominance, :integer
  end
end
