class RemoveAccountFromExercises < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercises, :account_id
  end
end
