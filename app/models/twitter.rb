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
      result = self.order_tweets(result)
    end
    
    result
  end

  def self.order_tweets(tweets)
    ordenados = Array.new
    cont = 0
    tweets.each do |t|
      if t['user']['followers_count'] #> ordenados[cont]['user']['followers_count']
      	ordenados << t
      else
        ordenados[cont] << t['user']['followers_count']
      end
    end

    ordenados
  end

end
