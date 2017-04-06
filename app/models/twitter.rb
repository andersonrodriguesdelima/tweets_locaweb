class Twitter < ApplicationRecord
  
  def self.search_most_relevants
  	uri = URI('http://tweeps.locaweb.com.br/tweeps?Q=%40locaweb')

    req = Net::HTTP::Get.new(uri)
    req['Username'] = 'anderson.rodrigues.lima@hotmail.com'

    respost = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

  	result = Array.new
    json = JSON.parse respost.body
    json.each do |key, tweets|
      tweets.each do |tweet|
        if tweet['in_reply_to_user_id_str'].eql? "42"
          result << tweet
        end
        tweet['entities']['user_mentions'].each do |mentions|
      	  if mentions['id'].eql? 42
      	    result << tweet
      	  end	
        end
      end
    end
    result = self.order_tweets(result)
    
    result
  end

  def self.order_tweets(tweets)
    ordenados = []
    maior_numero_followers = 0
    tweets.each do |t|
		if t['user']['followers_count'] > maior_numero_followers
			puts "#{maior_numero_followers} // #{t['user']['followers_count']}"
			ordenados.unshift(t)
			maior_numero_followers = t['user']['followers_count']
		else
			ordenados << t
		end
	end

	ordenados
  end

end
