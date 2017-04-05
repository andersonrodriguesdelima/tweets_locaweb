class SessionController < ApplicationController
	def create
	  #render xml: 
	  info = request.env['omniauth.auth']['info']
	  session[:user] = info[:nickname]

	  access_token = request.env['omniauth.auth']['extra']['access_token']
	  session[:token] = access_token.token
	  redirect_to root_path
	end

	def destroy
	   session[:user] = nil

	   redirect_to root_path
    end
end
