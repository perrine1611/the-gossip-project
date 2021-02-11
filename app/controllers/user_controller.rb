class UserController < ApplicationController

	def show
    	@user = User.find(params[:id].to_i)
    	@city = City.find(@user.city_id)
 	end

 	def new
 		@user = User.new
 	end
  
end
