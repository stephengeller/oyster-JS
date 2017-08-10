class Journey

  attr_reader :entry_station
  attr_accessor :exit_station, :fare

  def initialize(entry_station)
    @entry_station = entry_station
  end

end
