class TwitterController < ApplicationController

	def most_relevants
      @result = Twitter.search_most_relevants
	end

end