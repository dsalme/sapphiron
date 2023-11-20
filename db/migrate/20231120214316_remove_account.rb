class RemoveAccount < ActiveRecord::Migration[7.1]
  def change
    drop_table :account_login_change_keys
    drop_table :account_verification_keys
    drop_table :account_password_reset_keys
    drop_table :profiles
    drop_table :accounts
  end
end
