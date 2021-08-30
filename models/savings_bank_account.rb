# Concrete implementation of Bank Account Abstraction representing Savings Bank Account
require_relative 'bank_account'

class SavingsBankAccount < BankAccount
  
  def initialize(account_no, account_holders, initial_deposit)
    raise 'Minimum initial deposit should be 100' if initial_deposit < 100

    @account_no = account_no
    @account_holders = account_holders.split(',')
    @current_balance = initial_deposit
  rescue => e
    puts e
  end

  def deposit(deposit_amount)
    raise 'Deposit Amount should be > 0' if deposit_amount <= 0
  
    @current_balance += deposit_amount
  rescue => e
    puts e
  end

  def withdraw(withdraw_amount)
    raise 'Minimum Balance should be 100' if withdraw_amount + 100 > @current_balance
  
    @current_balance -= withdraw_amount
  rescue => e
    puts e
  end

  def accumulate_interest
    # Savings Bank Account interest based on current balance
    interest_rate = if @current_balance < 2000
      0.01
    elsif @current_balance >= 2000 and @current_balance < 12000
      0.05
    elsif @current_balance >= 12000
      0.1
    end
    interest = @current_balance * interest_rate / 100
    @current_balance += interest
  end
end