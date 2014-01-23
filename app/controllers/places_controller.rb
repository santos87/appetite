class PlacesController < ApplicationController

	def index
		# @places = Place.near("London")

		# if the user has searched for a location
		# search near the param they typed in
		# else show all the places near London
		# the param they've searched for is params[:location]

		if params[:location].present?
			# search for the places near params[:location]
			@places = Place.near(params[:location])
		else
			# search for places near London
			@places = Place.near("London")
		end
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new(place_params)

		if @place.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def place_params
		params.require(:place).permit(:title, :address, :latitude, :longitude)
	end

end
