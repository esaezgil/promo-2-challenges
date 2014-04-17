# Optional
class Transaction
  attr_reader :amount, :date
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.new
  end

  def to_s
     #Nicely print transaction infos using Time#strftime.
    "Transaction :
      Amount: #{@amount}
      Date: #{@date.strftime("%m/%d/%Y at %I:%M%p")}"
  end
end
p Transaction.new(400).to_s
