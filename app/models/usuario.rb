class Usuario < ApplicationRecord
	has_many :tweets, -> {joins(:usuario).order('usuarios.numero_followers DESC, retweets DESC, likes DESC')}

	def self.most_mentions_html
		Twitter.find_tweets
    end

    def self.most_mentions
		result = []
		Usuario.order_followers.each do |u|
        hash_info = Hash.new
        u.tweets.each do |t|
    		hash_info.store('screen_name', "#{u.screen_name}")
            hash_info.store('url_twitter', "http://twitter.com/#{t.usuario.screen_name}")
            hash_info.store('followers_cont', "#{t.usuario.numero_followers}")
            hash_info.store('retweets', "#{t.retweets}")
            hash_info.store('favorites_count', "#{t.likes}")
            hash_info.store('text', "#{t.text}")
            hash_info.store('created_at', "#{t.twitter_created_at}")
        	end
            result << hash_info
        end

        result.to_json
    end

    def self.order_followers
    	Usuario.order('numero_followers DESC')
    end
end
