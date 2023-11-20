class RemoveAccountFromProfile < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :account_id
  end
end
