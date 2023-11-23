class AddNewColumnToAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :type, :string, null: false, default: 'user'
  end
end
