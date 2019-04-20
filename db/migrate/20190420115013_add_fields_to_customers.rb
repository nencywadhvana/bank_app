class AddFieldsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :middle_name, :string
    add_column :customers, :mobile, :string
    add_column :customers, :account_type, :string
    add_column :customers, :account_number, :string
    add_column :customers, :account_balance, :float, :default => 0.0
  end
end
