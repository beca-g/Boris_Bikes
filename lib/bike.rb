class Bike

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
