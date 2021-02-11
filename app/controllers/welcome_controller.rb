class WelcomeController < ApplicationController
	
	def index
		@first_name = params[:id]
		@gossip = Gossip.all
	end
end
