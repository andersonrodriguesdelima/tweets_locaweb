class TwitterController < ApplicationController
	def most_relevants
      uri = URI('http://tweeps.locaweb.com.br/tweeps')

      req = Net::HTTP::Get.new(uri)
      req['Username'] = 'anderson.rodrigues.lima@hotmail.com'

      res = Net::HTTP.start(uri.hostname, uri.port) {|http|
        http.request(req)
      }

      render json: res.body
	  #redirect_to "http://tweeps.locaweb.com.br/tweeps?q=%23locaweb&Username=anderson%2erodrigues%2e%lima%23hotmail%2ecom"
	end
end