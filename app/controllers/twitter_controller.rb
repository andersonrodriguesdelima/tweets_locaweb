class TwitterController < ApplicationController
	before_action :authenticate
	
	def iniciar
		redirect_to 'home/index'
	end
end
