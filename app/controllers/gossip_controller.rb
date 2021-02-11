class GossipController < ApplicationController

	def show
		@gossip = Gossip.find(params[:id].to_i)
        @city = City.find(@gossip.user.city_id)
	end

	def new
		@gossip = Gossip.new
		@user = User.find(params[:id])
	end

	def create
  		@gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user' => params[:user])

  		if @gossip.save # essaie de sauvegarder en base @gossip
  		render 'welcome/index' # si ça marche, il redirige vers la page d'index du site
  		
  		else
  		render 'new' # sinon, il render la view new (qui est celle sur laquelle on est déjà)
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


end
