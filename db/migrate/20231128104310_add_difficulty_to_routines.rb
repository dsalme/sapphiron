class AddDifficultyToRoutines < ActiveRecord::Migration[7.1]
  def change
    add_column :routines, :difficulty, :integer
  end
end
