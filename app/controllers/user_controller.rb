class UserController < ApplicationController

	def show
    	@user = User.find(params[:id])
    	@city = City.find(@user.city_id)
 	end

 	def new
 		@user = User.new
 		@cities = City.order(:name)
 	end

 	def create_params
 		params.permit(:first_name, :last_name, :description, :age, :city, :email, :password)
 	end

 	def create
 		@user = User.new(
 			first_name: create_params[:first_name], 
 			last_name: create_params[:last_name],
 			description: create_params[:description],
 			age: create_params[:age],
 			city_id: create_params[:city],
 			email: create_params[:email], 
 			password: create_params[:password])

  		if @user.save
        helpers.log_in(@user)

        flash[:success] = "Inscription réussie"
  		   render "welcome/index"
  		
  		else
        flash[:danger] = "Echec de l'inscription"
         @cities = City.order(:name)
  		  render "new"
 		end

	end

end
