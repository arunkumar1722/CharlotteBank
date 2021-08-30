# Checking Bank Account Unit Test Cases
require 'test/unit'
require_relative '../models/checking_bank_account'

class CheckingBankAccountTest < Test::Unit::TestCase

  def setup
    @account_no = rand(10**10).to_s
    @checking_account = CheckingBankAccount.new(@account_no, 'Alejandro Lopez-Perez')
  end

  def teardown
    @checking_account = nil
  end

  def test_assert_bank_account_details
    assert_equal @account_no, @checking_account.account_no
    assert_equal ['Alejandro Lopez-Perez'], @checking_account.account_holders
    assert_equal 0, @checking_account.current_balance
  end

  def test_add_account_holder
    @checking_account.add_account_holder('Sasha Ivanov')
    assert_equal ['Alejandro Lopez-Perez', 'Sasha Ivanov'], @checking_account.account_holders
  end

  def test_deposit_amount
    @checking_account.deposit(100)
    assert_equal 100, @checking_account.current_balance
  end

  def test_accumulate_interest
    current_balance = @checking_account.current_balance
    interest = current_balance * 0.01 / 100
    @checking_account.accumulate_interest
    assert_equal current_balance + interest, @checking_account.current_balance
  end

  def test_withdraw_amount
    @checking_account.withdraw(100)
    assert_equal 0, @checking_account.current_balance
  end

 def test_deposit_zero_amount
    @checking_account.deposit(0)
    assert_raise 'Deposit Amount should be > 0'
  end

  def test_insufficient_balance
    @checking_account.withdraw(1)
    assert_raise 'Insufficient Balance'
  end
end