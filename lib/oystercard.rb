require './lib/journey.rb'
class Oystercard

  attr_reader :balance, :max_balance, :journey, :journeys

  DEFAULT_BALANCE = 0
  DEFAULT_MAX_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE, max_balance = DEFAULT_MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
    @journeys = []
    @journey = Journey.new
  end

  def top_up(credit)
    raise "unable to top up as balance would exceed maximum of £#{@max_balance}" if (@balance + credit) > @max_balance
    @balance += credit
  end

  def touch_in(station)
    raise "You do not have enough money to travel" if @balance < 1
    @entry_station = station
    deduct(@journey.fare) unless @journey == nil
    @journey.start(station)
  end

  def touch_out(station)
    @journey.exit_station = station
    @journeys << @journey
    deduct(@journey.fare)
    @journey.end(station)
  end

  private

  def deduct(debit)
    @balance -= debit
  end

end
