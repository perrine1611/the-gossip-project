class CitiesController < ApplicationController
	
	def show
		@city = City.find(params[:id])
		@gossip_array = Gossip.joins(:user).where(:user => User.where(city_id: params[:id]))
	end
end
