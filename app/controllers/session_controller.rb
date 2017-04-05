class SessionController < ApplicationController
	def create
	  render xml: request.env['omniauth.auth']
	end
end
