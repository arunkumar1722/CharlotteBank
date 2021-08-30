# Concrete implementation of Bank Account Abstraction representing Checking Bank Account
require_relative 'bank_account'

class CheckingBankAccount < BankAccount
  
  def initialize(account_no, account_holders, initial_deposit = 0)
    @account_no = account_no
    @account_holders = account_holders.split(',')
    @current_balance = initial_deposit
  end

  def deposit(deposit_amount)
    raise 'Deposit Amount should be > 0' if deposit_amount <= 0

    @current_balance += deposit_amount
  rescue => e
    puts e
  end

  def withdraw(withdraw_amount)
    raise 'Insufficient Balance' if withdraw_amount > @current_balance

    @current_balance -= withdraw_amount
  rescue => e
    puts e
  end

  def accumulate_interest
    # Checking bank account flat interest
    interest = @current_balance * 0.01 / 100
    @current_balance += interest
  end
end