# Main class to demonstrate Bank Account
require_relative 'models/checking_bank_account'
require_relative 'models/savings_bank_account'

class App
  # Checking Account
  checking_account = CheckingBankAccount.new(rand(10**10).to_s, 'Alejandro Lopez-Perez')
  puts "Account No: #{checking_account.account_no}"

  checking_account.deposit(1500)
  puts checking_account.current_balance

  checking_account.withdraw(150)
  puts checking_account.current_balance

  checking_account.accumulate_interest
  puts checking_account.current_balance

  checking_account.withdraw(750)
  puts checking_account.current_balance

  checking_account.accumulate_interest
  puts checking_account.current_balance

  # Savings Account
  savings_account = SavingsBankAccount.new(rand(10**10).to_s, 'Sasha Ivanov', 600)
  puts "Account No: #{savings_account.account_no}"

  savings_account.accumulate_interest
  puts savings_account.current_balance

  savings_account.deposit(150)
  puts savings_account.current_balance

  savings_account.accumulate_interest
  puts savings_account.current_balance

  savings_account.withdraw(600)
  puts savings_account.current_balance
end