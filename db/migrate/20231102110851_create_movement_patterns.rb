class CreateMovementPatterns < ActiveRecord::Migration[7.1]
  def change
    create_table :movement_patterns do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
