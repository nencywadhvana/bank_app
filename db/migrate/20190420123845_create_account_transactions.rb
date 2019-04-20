class CreateAccountTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transactions do |t|
      t.string :action
      t.float :amount
      t.references :customer, foreign_key: true
      t.integer :receiver_id

      t.timestamps
    end
  end
end
