class Oystercard
  attr_accessor :balance, :in_use, :max_balance

  DEFAULT_BALANCE = 0
  DEFAULT_MAX_BALANCE = 90
  def initialize(balance = DEFAULT_BALANCE, max_balance = DEFAULT_MAX_BALANCE, in_use = false)
    @balance = balance
    @max_balance = max_balance
    @in_use = in_use
  end

  def top_up(credit)
    raise "unable to top up as balance would exceed maximum of £#{@max_balance}" if (@balance + credit) > @max_balance
    @balance += credit
  end

  def deduct(debit)
    @balance -= debit
  end

  def in_journey?
    if @in_use == false
      "Card not in use on journey"
    else
      "Card in use on journey"
    end
  end

  def touch_in
    @in_use = true
    # "Card is in use on journey"
  end
  
  def touch_out
    @in_use = false
    # "Card is not in use on journey"
  end

end
