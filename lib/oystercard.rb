require './lib/journey.rb'
class Oystercard

  attr_reader :balance, :max_balance, :entry_station, :exit_station
  PENALTY = 6
  DEFAULT_BALANCE = 0
  DEFAULT_MAX_BALANCE = 90
  def initialize(balance = DEFAULT_BALANCE, max_balance = DEFAULT_MAX_BALANCE)
    @balance = balance
    @max_balance = max_balance
    @journeys = []
  end

  def top_up(credit)
    raise "unable to top up as balance would exceed maximum of £#{@max_balance}" if (@balance + credit) > @max_balance
    @balance += credit
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "You do not have enough money to travel" if @balance < 1
    @entry_station = station
    @journeys 
  end

  def touch_out(fare = 1, station)
    @exit_station = station
    @journeys << { :entry_station => @entry_station, :exit_station => @exit_station }
    @entry_station = nil
    deduct(fare)
  end

  def history
    @journeys
  end

  private

  def deduct(debit)
    @balance -= debit
  end

end

o = Oystercard.new
o.top_up(10)
o.touch_in(:London)
o.touch_in(:Bristol)
puts o.balance
