class Tweet < ApplicationRecord
	belongs_to :usuario

	def self.most_relevants
		Twitter.find_tweets
		Tweet.joins("INNER JOIN usuarios ON usuarios.id = tweets.usuario_id").order('usuarios.numero_followers DESC, retweets DESC, likes DESC')
    end
end
