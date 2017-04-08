class Usuario < ApplicationRecord
	has_many :tweets, :class_name => Tweet

	def most_mentions
		#Twitter.find_tweet
		Tweet.joins("INNER JOIN usuarios ON usuarios.id = tweets.usuario_id").order('usuarios.numero_followers DESC, retweets DESC, likes DESC')#.find_by(usuario_id: self)
    end
end
