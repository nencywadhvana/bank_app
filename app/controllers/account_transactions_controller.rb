class AccountTransactionsController < ApplicationController
  
  def deposit
    @account = current_customer.account_transactions.build
  end

  def update_account
    if params[:account_transaction][:action] == "deposit"
      current_customer.account_transactions.create(account_transactions_params)
      Customer.deposit(current_customer, params[:account_transaction][:amount])
      flash[:success] = "Your amount deposited!"
    elsif params[:account_transaction][:action] == "withdraw"
      if AccountTransaction.amount_valid?(current_customer.account_balance, params[:account_transaction][:amount].to_f)
          if Customer.withdraw(current_customer,params[:account_transaction][:amount])
            current_customer.account_transactions.create(account_transactions_params)
          else
            flash[:danger] = "something went wrong"
          end
        flash[:success] = "withdraw successfully"
      else
        flash[:danger] = "Sorry Please Check you balance"
      end
    end
    redirect_to root_path
  end  

  def show
  end

  def withdraw
    @account = current_customer.account_transactions.build
  end

  def transfer
  end

  private

  def account_transactions_params
    params.require(:account_transaction).permit(:amount, :customer_id, :action)
  end

end
