class WelcomeController < ApplicationController
	
	before_action :authenticate_user, only: [:index]

	def index
		@first_name = params[:id]
		@gossip = Gossip.all
	end

	 private

  	def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end


end
