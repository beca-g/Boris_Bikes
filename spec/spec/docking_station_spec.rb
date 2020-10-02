require './lib/docking_station'

describe DockingStation do

  describe "initialization" do
    it "sets capacity to users input" do
      subject = DockingStation.new(30)
      expect(subject.capacity).to eq 30
    end
    it "sets capacity to default capacity if no capacity is given" do
      subject = DockingStation.new
      expect(subject.capacity).to eq (DockingStation::DEFAULT_CAPACITY)
    end
  end

  describe "#release bike" do
  let (:bike) { double :bike }
    it "responds to the release_bike" do
      is_expected.to respond_to :release_bike
    end

    it "releases working bikes" do
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:is_broken?).and_return(false)
      subject.dock_bike(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end
 
    it "won't release broken bikes" do
      allow(bike).to receive(:is_broken?).and_return (true)
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error("Error, no bikes in the docking station")
    end

    it "raises an error when there are no bikes avaliable to release" do
      allow(bike).to receive(:empty?).and_return (true) 
      allow(bike).to receive(:is_broken?).and_return (true)  
      subject.capacity.times {subject.dock_bike bike}      
      expect { subject.release_bike }.to raise_error("Error, no bikes in the docking station")
    end
  end

  describe "#dock_bike" do
    let (:bike) { double :bike }
    it "will raise an error if the dock is full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike double :bike }
      expect { subject.dock_bike double :bike }.to raise_error("Error, docking station is full")
    end
  end
end
