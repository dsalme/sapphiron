class CreateRoutineBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :routine_blocks do |t|
      t.references :routine, null: false, foreign_key: true
      t.references :block, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
