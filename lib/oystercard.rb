class Oystercard

  attr_reader :balance, :max_balance, :station

  DEFAULT_BALANCE = 0
  DEFAULT_MAX_BALANCE = 90
  def initialize(balance = DEFAULT_BALANCE, max_balance = DEFAULT_MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
  end

  def top_up(credit)
    raise "unable to top up as balance would exceed maximum of £#{@max_balance}" if (@balance + credit) > @max_balance
    @balance += credit
  end



  def in_journey?
    @station != nil
  end

  # def in_journey?
  #   if @in_use == false
  #     "Card not in use on journey"
  #   else
  #     "Card in use on journey"
  #   end
  # end

  def touch_in(station)
    raise "You do not have enough money to travel" if @balance < 1
    @station = station
  end

  def touch_out(fare)
    deduct(fare)
    @station = nil
    # "Card is not in use on journey"
  end

  private

  def deduct(debit)
    @balance -= debit
  end

end
