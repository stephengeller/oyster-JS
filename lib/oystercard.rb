class Oystercard
  attr_reader :balance

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

end
