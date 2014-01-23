class Place < ActiveRecord::Base

	geocoded_by :address     #, latitude: :lat, longitude: :lng

	after_validation :geocode 


	validates :title, presence: true
	validates :address, presence: true


end
