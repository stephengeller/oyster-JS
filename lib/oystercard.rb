require './lib/journey.rb'
class Oystercard

  attr_reader :balance, :max_balance, :journey, :journeys

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

  def touch_in(station)
    raise "You do not have enough money to travel" if @balance < 1
    deduct( @journey.fare) unless @journey.nil?
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if @journey.nil?
    @journey.exit_station = station
    @journeys << @journey
    deduct(@journey.fare)
    @journey = nil
  end

  def in_journey?
    !@journey.nil?
  end

  private

  def deduct(debit)
    @balance -= debit
  end



end
