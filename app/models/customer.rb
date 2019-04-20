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

end
