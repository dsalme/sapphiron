class AddNewColumnToAccountAccountType < ActiveRecord::Migration[7.1]
  def change
    rename_column :accounts, :type, :account_type
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
