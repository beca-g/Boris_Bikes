require './lib/bike.rb'

describe Bike do
    it { expect(Bike.new).to respond_to (:working?) }

    it { expect(Bike.new).to respond_to (:broken) }
end
