require './lib/docking_station'

describe DockingStation do 
  it "responds to the release_bike" do
  is_expected.to respond_to :release_bike
end

  it "gets a Bike and expects the Bike to be working" do 
    bike = Bike.new
    expect(bike.working?).to be true 
  end

  #  it "docks bike at station" do
  #    docking_station = DockingStation.new
  #    expect(docking_station.dock_bike).to eq "Bike successfully docked"
  #  end

  describe "#release bike" do
    it "the docking station raises an error when there are no bikes" do
      9.times {subject.dock_bike(Bike.new)}
      9.times {subject.release_bike}
      expect { subject.release_bike }.to raise_error("Error, no bikes in the docking station")
    end
  end

  describe "#dock_bike" do
    it "will raise an exception if the dock is full" do
      bike = Bike.new
      20.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error("Error, docking station is full")
    end


  end

end