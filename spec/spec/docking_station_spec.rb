require './lib/docking_station'

describe DockingStation do
  it "responds to the release_bike" do
  is_expected.to respond_to :release_bike
end
  it "gets a Bike and expects the Bike to be working" do
    double :bike
    expect(bike.working?).to be true
  end
  it "sets capacity to users input" do
    subject = DockingStation.new(30)
    expect(subject.capacity).to eq 30
  end
  it "sets capacity to default capacity if no capacity is given" do
    subject = DockingStation.new
    expect(subject.capacity).to eq (DockingStation::DEFAULT_CAPACITY)
  end

  describe "#release bike" do
    it "the docking station raises an error when there are no bikes" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike double :bike}
      DockingStation::DEFAULT_CAPACITY.times {subject.release_bike}
      expect { subject.release_bike }.to raise_error("Error, no bikes in the docking station")
    end

    it "won't release broken bikes" do
      double :bike
      bike.broken
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error("Error, no bikes in the docking station")
    end

  end

  describe "#dock_bike" do
    it "will raise an exception if the dock is full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike double :bike }
      expect { subject.dock_bike double :bike }.to raise_error("Error, docking station is full")
    end
  end
end
