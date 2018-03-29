class BankAccount
  attr_reader :name, :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{avi.balance}."
  end

  def valid?
    return false if @balance <= 0 || @status == "closed"
    return true
  end
end
