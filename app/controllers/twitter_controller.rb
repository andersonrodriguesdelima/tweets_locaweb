class TwitterController < ApplicationController
	before_action :authenticate

	def iniciar
       redirect_to root_path
	end

	def most_relevants
		redirect_to "http://tweeps.locaweb.com.br/tweeps?q=%23locaweb&Username=anderson%2erodrigues%2e%lima%23hotmail%2ecom"
	end
end
