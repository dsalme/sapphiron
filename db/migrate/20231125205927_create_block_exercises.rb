class CreateBlockExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :block_exercises do |t|
      t.references :block, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :repetitions
      t.text :description

      t.timestamps
    end
  end
end
