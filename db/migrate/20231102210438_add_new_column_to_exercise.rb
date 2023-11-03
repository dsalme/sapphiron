class AddNewColumnToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :difficulty, :integer
  end
end
