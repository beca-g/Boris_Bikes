require './docking_station'

describe "DockingStation" do 
    it "returns 'bike'" do
      expect (docking_station(release_bike)).to eq bike
    end
end