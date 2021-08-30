# Savings Bank Account Unit Test Cases
require 'test/unit'
require_relative '../models/savings_bank_account'

class SavingsBankAccountTest < Test::Unit::TestCase

  def setup
    @account_no = rand(10**10).to_s
    @savings_account = SavingsBankAccount.new(@account_no, 'Sasha Ivanov', 100)
  end

  def teardown
    @savings_bank_account = nil
  end

  def test_assert_bank_account_details
    assert_equal @account_no, @savings_account.account_no
    assert_equal ['Sasha Ivanov'], @savings_account.account_holders
    assert_equal 100, @savings_account.current_balance
  end

  def test_add_account_holder
    @savings_account.add_account_holder('Alejandro Lopez-Perez')
    assert_equal ['Sasha Ivanov', 'Alejandro Lopez-Perez'], @savings_account.account_holders
  end

  def test_deposit_amount
    @savings_account.deposit(100)
    assert_equal 200, @savings_account.current_balance
  end

  def test_withdraw_amount
    @savings_account.withdraw(100)
    assert_equal 100, @savings_account.current_balance
  end

 def test_deposit_zero_amount
    @savings_account.deposit(0)
    assert_raise 'Deposit Amount should be > 0'
  end

  def test_insufficient_balance
    @savings_account.withdraw(1)
    assert_raise 'Minimum Balance should be 100'
  end

  def test_accumulate_interest_less_than_2000
    current_balance = @savings_account.current_balance
    interest = current_balance * 0.01 / 100
    @savings_account.accumulate_interest
    assert_equal current_balance + interest, @savings_account.current_balance
  end

  def test_accumulate_interest_greater_than_2000_and_less_than_12000
    @savings_account.deposit(2000)
    current_balance = @savings_account.current_balance
    interest = current_balance * 0.05 / 100
    @savings_account.accumulate_interest
    assert_equal current_balance + interest, @savings_account.current_balance
  end

  def test_accumulate_interest_greater_than_12000
    @savings_account.deposit(12000)
    current_balance = @savings_account.current_balance
    interest = current_balance * 0.1 / 100
    @savings_account.accumulate_interest
    assert_equal current_balance + interest, @savings_account.current_balance
  end

  def test_savings_account_with_no_initial_amount
    new_savings_account = SavingsBankAccount.new(@account_no, 'Sasha Ivanov', 99)
    assert_raise 'Minimum initial deposit should be 100'
  end
end