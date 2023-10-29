class CreateMuscleGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :muscle_groups do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
