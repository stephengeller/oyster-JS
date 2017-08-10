class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station
  attr_accessor :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def fare
    return MINIMUM_FARE unless (@entry_station.nil? || @exit_station.nil? )
    PENALTY_FARE
  end

  # def start(station)
  #   @entry_station = station
  # end

  # def end_journey
  #   @entry_station, @exit_station = nil, nil
  # end



end
