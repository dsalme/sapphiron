class CreateBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :blocks do |t|
      t.string :name
      t.text :description
      t.references :protocol, null: false, foreign_key: true
      t.references :aspect, null: false, foreign_key: true
      t.integer :series
      t.integer :duration

      t.timestamps
    end
  end
end
