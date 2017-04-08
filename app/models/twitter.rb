class Twitter < ApplicationRecord
  
  def self.most_relevants
	json = self.obtain_json

    json.each do |key, tweets|
      tweets.each do |tweet|
        if tweet['in_reply_to_user_id_str'].eql? "42" and Tweet.find_by(:id_tweet => tweet['id_str']).nil?
			user = self.criar_usuario(tweet)
			self.criar_tweet(tweet, user)
        end

        tweet['entities']['user_mentions'].each do |mentions|
      	  if mentions['id'].eql? 42 and Tweet.find_by(:id_tweet => tweet['id_str']).nil?
			user = self.criar_usuario(tweet)
			self.criar_tweet(tweet, user)
      	  end
        end
      end
    end
  end

	def self.criar_tweet(tweet, user)
		tweet = Tweet.new(
			:text => tweet['text'],
			:id_tweet => tweet['id_str'],
			:retweets => tweet['retweet_count'],
			:likes => tweet['favorite_count'],
			:twitter_created_at => tweet['created_at'].to_datetime,
			:user_twitter_id => user.twitter_id,
			:usuario_id => user.id)
		tweet.save!

		tweet
	end

	def self.criar_usuario(tweet)
		user = Usuario.new(
			:twitter_id => tweet['user']['id_str'],
			:screen_name => tweet['user']['screen_name'],
			:numero_followers => tweet['user']['followers_count'])
		user.save!

		user
	end
end