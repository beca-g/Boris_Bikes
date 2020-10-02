class Bike
	# #attr_reader :name
	# def initialize
  #   @name = name
	# end
	@broken = false

  def working?
    true
  end

	def broken
		@broken = true
	end

	def is_broken?
		@broken
	end

end
