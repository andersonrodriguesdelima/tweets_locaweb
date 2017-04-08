class TwitterController < ApplicationController

	def most_relevants
      @result = Twitter.most_relevants
	end

end