require './lib/vans'

	describe Van do
		let (:bike) {double :bike }
		it "responds to the collects_broken_bikes" do
			bike = double(:bike)
			bike.collect_broken_bikes
			is_expected.to {subject.is_broken?.collect_broken_bikes}.to eq (true)
		end
	end

