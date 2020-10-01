class DockingStation 
  attr_reader :list
  def initialize
    @bike_array = []
  end

  def release_bike  
    fail ("Error, no bikes in the docking station") unless @bike_array.length >= 1
    @bike_array.pop
  end

  def dock_bike(bike)
    fail ("Error, docking station is full") if @bike_array.length == 20
    @bike
    @bike_array.push(bike)
  end
end
