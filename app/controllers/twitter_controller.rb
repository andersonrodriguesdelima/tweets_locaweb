class TwitterController < ApplicationController

	def most_relevants
		Tweet.most_relevants
	end

	def most_mentions
		#Usuario.most_mentions
    end
end