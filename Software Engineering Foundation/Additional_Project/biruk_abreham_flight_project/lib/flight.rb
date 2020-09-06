class Flight

  attr_reader :passengers
  
  def initialize(flight_num, capacity)
    @flight_number = flight_num
    @capacity = capacity
    @passengers = []
  end

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(passenger)
    if passenger.has_flight?(@flight_number) && !self.full?
      @passengers << passenger
    end
  end

  def list_passengers
    @passengers.map { |passenger| passenger.name }
  end
  
  def [] (idx)
    @passengers[idx]
  end

  def << (passenger)
    self.board_passenger(passenger)
  end

end
