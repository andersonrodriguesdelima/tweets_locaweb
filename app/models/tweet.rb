class Tweet < ApplicationRecord
	belongs_to :usuario

	def self.tweets_ordenados
		Tweet.joins("INNER JOIN usuarios ON usuarios.id = tweets.usuario_id").order('usuarios.numero_followers DESC, retweets DESC, likes DESC')
    end
end
