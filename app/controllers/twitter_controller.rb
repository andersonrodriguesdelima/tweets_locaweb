class TwitterController < ApplicationController

	def most_relevants_html
		Tweet.most_relevants_html
	end

	def most_relevants
		@result = Tweet.most_relevants
	end

	def most_mentions_html
		Usuario.most_mentions
    end

    def most_mentions
    	@result = Usuario.most_mentions
    end
end