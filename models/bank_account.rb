# Abstract class Implementation
class BankAccount
  attr_accessor :account_no, :account_holders, :current_balance

  def initialize
    raise NotImplementedError, "Subclasses must define `initialize`."
  end

  def account_no
    @account_no
  end

  def account_holders
    @account_holders
  end

  def add_account_holder(account_holder)
    @account_holders << account_holder
  end

  def current_balance
    @current_balance
  end

  def deposit
    raise NotImplementedError, "Subclasses must define `deposit`."
  end

  def withdraw
    raise NotImplementedError, "Subclasses must define `withdraw`."
  end

  def accumulate_interest
    raise NotImplementedError, "Subclasses must define `accumulate_interest`."
  end
end