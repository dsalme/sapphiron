class AddOrderToBlockExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :block_exercises, :order, :integer
  end
end
