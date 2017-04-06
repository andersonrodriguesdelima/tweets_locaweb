class TwitterController < ApplicationController
	require 'json'

	def most_relevants
      uri = URI('http://tweeps.locaweb.com.br/tweeps?q=%40locaweb&result_type=mixed')

      req = Net::HTTP::Get.new(uri)
      req['Username'] = 'anderson.rodrigues.lima@hotmail.com'

      res = Net::HTTP.start(uri.hostname, uri.port) {|http|
        http.request(req)
      }
      @result = ['']
      teste =  JSON.parse res.body
      teste['statuses'].each do |t|
      	@result << t['text']
      end

	  #redirect_to "http://tweeps.locaweb.com.br/tweeps?q=%23locaweb&Username=anderson%2erodrigues%2e%lima%23hotmail%2ecom"
	end
end