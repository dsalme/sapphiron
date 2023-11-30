class CreateBlockInnerBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :block_inner_blocks do |t|
      t.belongs_to :block, null: false, foreign_key: true
      t.belongs_to :inner_block, null: false, foreign_key: { to_table: :blocks }

      t.timestamps
    end
  end
end
