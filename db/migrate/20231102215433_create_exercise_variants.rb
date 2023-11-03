class CreateExerciseVariants < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_variants do |t|
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :variant, null: false, foreign_key: { to_table: :exercises }

      t.timestamps
    end
  end
end
