require 'test_helper'

class AccountTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get deposite" do
    get account_transactions_deposite_url
    assert_response :success
  end

  test "should get show" do
    get account_transactions_show_url
    assert_response :success
  end

  test "should get withdraw" do
    get account_transactions_withdraw_url
    assert_response :success
  end

  test "should get transfer" do
    get account_transactions_transfer_url
    assert_response :success
  end

end
