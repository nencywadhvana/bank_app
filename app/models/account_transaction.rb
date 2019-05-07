class AccountTransaction < ApplicationRecord
  belongs_to :customer, class_name: 'Customer'
  belongs_to :receiver, class_name: 'Customer', optional: true
  def self.amount_valid?(total_balance, withdraw_balance)
    return ( total_balance >= withdraw_balance ?  true : false )
  end
end
