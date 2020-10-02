require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_array = []
  end

  private
  def full?
    if @bike_array.length >= DEFAULT_CAPACITY
      true
    else
      false
    end
  end

  def empty?
    if @bike_array.length == 0
      true
    else
      false
    end
  end

  public
  def release_bike
    fail ("Error, no bikes in the docking station") if empty?
    @bike_array.pop
  end

  def dock_bike(bike)
    fail ("Error, docking station is full") if full?
    @bike_array.push(bike)
  end

end
