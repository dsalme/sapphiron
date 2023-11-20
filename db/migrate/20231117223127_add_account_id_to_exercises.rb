class AddAccountIdToExercises < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercises, :account, null: false, foreign_key: true
  end
end
