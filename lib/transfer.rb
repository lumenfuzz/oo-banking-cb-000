class Transfer
  attr_accessor :sender, :receiver, :status, :amount

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
    if !@sender.valid? || !@receiver.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    elsif @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
