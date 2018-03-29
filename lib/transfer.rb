class Transfer
  attr_accessor :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    return true if sender.valid? && receiver.valid?
    return false
  end

  def execute_transaction
    if !self.valid?
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
    end
  end

  
end
