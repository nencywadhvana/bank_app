class AccountTransaction < ApplicationRecord
  belongs_to :customer

  def self.amount_valid?(total_balance, withdraw_balance)
    if total_balance >= withdraw_balance
      return true
    else
      return false
    end
  end
end
