class CreateAccountTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transactions do |t|
      t.string :action
      t.float :amount
      t.integer :customer_id, index: true #add columns as integer
      t.integer :receiver_id, index: true #add columns as integer
      t.timestamps
    end
    add_foreign_key :account_transactions, :customers, column: :receiver_id
    add_foreign_key :account_transactions, :customers, column: :customer_id
  end
end
