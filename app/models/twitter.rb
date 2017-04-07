class Twitter < ApplicationRecord
  
  def self.search_most_relevants
  	uri = URI('http://tweeps.locaweb.com.br/tweeps')

    req = Net::HTTP::Get.new(uri)
    req['Username'] = 'anderson.rodrigues.lima@hotmail.com'

    respost = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

  	result = Array.new
    json = JSON.parse respost.body
    json.each do |key, tweets|
      tweets.each do |tweet|
        if tweet['in_reply_to_user_id_str'].eql? "42" and Tweet.find_by(:id_tweet => tweet['id_str']).nil?
          user = Usuario.create(
          	:twitter_id => tweet['user']['id_str'],
          	:screen_name => tweet['user']['screen_name'],
          	:numero_followers => tweet['user']['followers_count'])

          newtweet = Tweet.create(
          	:text => tweet['text'],
          	:id_tweet => tweet['id_str'],
          	:retweets => tweet['retweet_count'],
          	:likes => tweet['favorite_count'],
          	:twitter_created_at => tweet['created_at'].to_datetime,
          	:user_twitter_id => user.twitter_id,
          	:usuario_id => user.id)

          #result << newtweet
        end
        tweet['entities']['user_mentions'].each do |mentions|
      	  if mentions['id'].eql? 42 and Tweet.find_by(:id_tweet => tweet['id_str']).nil?
			user = Usuario.create(
          	:twitter_id => tweet['user']['id_str'],
          	:screen_name => tweet['user']['screen_name'],
          	:numero_followers => tweet['user']['followers_count'])

          	newtweet = Tweet.create(
          	:text => tweet['text'],
          	:id_tweet => tweet['id_str'],
          	:retweets => tweet['retweet_count'],
          	:likes => tweet['favorite_count'],
          	:twitter_created_at => tweet['created_at'].to_datetime,
          	:user_twitter_id => user.twitter_id,
          	:usuario_id => user.id)
          
      	    #result << newtweet
      	  end
        end
      end
    end
    Tweet.all.each do |t|
    	result << t.text
	end
  end
end