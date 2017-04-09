class Usuario < ApplicationRecord
	has_many :tweets, -> {joins(:usuario).order('usuarios.numero_followers DESC, retweets DESC, likes DESC')}

	def self.most_mentions
		Twitter.find_tweets
    end

    def self.order_followers
    	Usuario.order('numero_followers DESC')
    end
end
