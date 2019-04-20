class AccountTransactionsController < ApplicationController
  
  def deposit
    @account = current_customer.account_transactions.build
  end

  def update_account
    if  params[:account_transaction][:action] == "deposit"
      current_customer.account_transactions.create(account_transactions_params)
    end
    redirect_to root_path
  end  

  def show
  end

  def withdraw
  end

  def transfer
  end

  private

  def account_transactions_params
    params.require(:account_transaction).permit(:amount, :customer_id, :action)
  end

end
