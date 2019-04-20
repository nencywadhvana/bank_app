class AccountTransactionsController < ApplicationController
  
  def deposit
  end

  def index
    @transactions = current_customer.account_transactions
  end

  def show
  end

  def withdraw
  end

  def transfer
  end

  def update_account
    if params[:account_transaction][:action] == "deposit"
        Customer.deposit(current_customer, account_transactions_params, nil)
        flash[:success] = "Your amount deposited!"
    elsif params[:account_transaction][:action] == "withdraw"
      if AccountTransaction.amount_valid?(current_customer.account_balance, params[:account_transaction][:amount].to_f)
          Customer.withdraw(current_customer,account_transactions_params,nil)
          flash[:success] = "withdraw successfully"
      else
        flash[:danger] = "Sorry Please Check you balance"
      end
    elsif params[:account_transaction][:action] == "transfer"
      if AccountTransaction.amount_valid?(current_customer.account_balance, params[:account_transaction][:amount].to_f)
        receiver = Customer.find_by(account_number: params[:account_transaction][:account_number])
        Customer.withdraw(current_customer,account_transactions_params,receiver.id)
        Customer.deposit(receiver, account_transactions_params,receiver.id)
        flash[:success] = "Transfer amount is done successfully."
      else
        flash[:danger] = "Sorry you don't have enough balance!"
      end
    end
    redirect_to root_path
  end  


  private

  def account_transactions_params
    params.require(:account_transaction).permit(:amount, :customer_id, :action, :receiver_id)
  end

end
