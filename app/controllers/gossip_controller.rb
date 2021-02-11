class GossipController < ApplicationController

 before_action :authenticate_user

	def show
		@gossip = Gossip.find(params[:id].to_i)
    @city = City.find(@gossip.user.city_id)
	end

	def new
		@gossip = Gossip.new
		@user = current_user
	end

	def create

		@gossip = Gossip.create('title' => params[:title], 'content' => params[:content])
  		@gossip.user = current_user

  		if @gossip.save
    	flash[:success] = "Potin bien créé !"
    	redirect_to root_path
  		
  		else
    	render :new

 		end
	end


	def edit
		@gossip = Gossip.find(params[:id])
	end


	def update
  		@gossip = Gossip.find(params[:id])
  		
  		if @gossip.update('title' => params[:title], 'content' => params[:content])
    	redirect_to @gossip
  
  		else
    	render :edit
  		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossip_path
	end


  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connectez-vous ou créez un compte"
      redirect_to new_session_path
    end
  end

end
