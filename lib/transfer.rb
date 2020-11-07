require 'pry'


class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender 
    @receiver = receiver
    @status = status
    @amount = amount 
  end

  def valid? 
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction 
    # binding.pry
    if valid? && @status == "pending" && sender.balance > amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end



end
