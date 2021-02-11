class SessionsController < ApplicationController
	
	def new
		@user = User.new
	end

	def create

		# cherche s'il existe un utilisateur en base avec l’e-mail
  		user = User.find_by(email: params[:email])

  	    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  		if user && user.authenticate(password: params[:password])
    	session[:user_id] = user.id

    	# redirige où tu veux, avec un flash ou pas
    	flash[:success] = 'Connexion réussie'
    	render "welcome/index"
    	

  		else
    	flash.now[:danger] = 'Mot de passe et/ou email invalide'
    	render 'new'
  		end
	
	end

	def destroy
		session.delete(:user_id)
		flash[:success] = "Deconnexion réussie"
		render "welcome/index"
	end
end
