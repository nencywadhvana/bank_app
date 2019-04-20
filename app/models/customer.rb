class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :account_transactions

  after_create :get_account_number

  private

  def get_account_number
    self.update(account_number: SecureRandom.base58(14))
  end

  def self.deposit(customer, params,receiver=nil)
    customer.account_balance += params[:amount].to_f
    if customer.save!
      customer.account_transactions.create(amount: params[:amount],action: 'deposit', receiver_id:receiver)
    end
  end


  def self.withdraw(customer, params,receiver=nil)
    customer.account_balance -= params[:amount].to_f
    if customer.save!
      customer.account_transactions.create(amount: params[:amount],action: 'withdraw', receiver_id:receiver)
    end
  end

  def self.find_receiver(id)
    Customer.find_by_id(id)&.first_name
  end

end
