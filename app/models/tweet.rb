class Tweet < ApplicationRecord
	belongs_to :usuario

	def self.most_relevants_html
        Twitter.find_tweets
        Tweet.joins("INNER JOIN usuarios ON usuarios.id = tweets.usuario_id").order('usuarios.numero_followers DESC, retweets DESC, likes DESC')
    end

    def self.most_relevants
        buffer = ""
        tweets = Tweet.joins("INNER JOIN usuarios ON usuarios.id = tweets.usuario_id").order('usuarios.numero_followers DESC, retweets DESC, likes DESC')
        hash_info = Hash.new
        tweets.each do |t|
    		hash_info.store('screen_name', "#{t.usuario.screen_name}")
            hash_info.store('url_twitter', "http://twitter.com/#{t.usuario.screen_name}")
            hash_info.store('followers_cont', "#{t.usuario.numero_followers}")
            hash_info.store('retweets', "#{t.retweets}")
            hash_info.store('favorites_count', "#{t.likes}")
            hash_info.store('text', "#{t.text}")
            hash_info.store('created_at', "#{t.twitter_created_at}")
        end


        hash_info.to_json
    end
end
