require 'rails_helper'

RSpec.describe Tweet, :type => :model do
	before(:each) do
    	@usuario = Usuario.new(
    		:twitter_id => 1,
			:screen_name => "locaweb",
			:numero_followers => 1000)
    	@usuario.save!

		@tweet = Tweet.new(:text => "este é um teste",
			:id_tweet => 1000,
			:retweets => 0,
			:likes => 0,
			:twitter_created_at => "01-01-2017 01:01".to_datetime,
			:user_twitter_id => @usuario.twitter_id,
			:usuario_id => @usuario.id)
		@tweet.save!

		@hash_info = Hash.new
		tweets = Tweet.joins("INNER JOIN usuarios ON usuarios.id = tweets.usuario_id").order('usuarios.numero_followers DESC, retweets DESC, likes DESC')
		tweets.each do |t|
    		@hash_info.store('screen_name', "#{t.usuario.screen_name}")
            @hash_info.store('url_twitter', "http://twitter.com/#{t.usuario.screen_name}")
            @hash_info.store('followers_cont', "#{t.usuario.numero_followers}")
            @hash_info.store('retweets', "#{t.retweets}")
            @hash_info.store('favorites_count', "#{t.likes}")
            @hash_info.store('text', "#{t.text}")
            @hash_info.store('created_at', "#{t.twitter_created_at}")
        end
	end

	it "deve cadastrar um tweet" do
    	@tweet.should be_valid
    	@tweet.id_tweet.should == 1000
    	@tweet.retweets.should == 0
    	@tweet.likes.should == 0
    	@tweet.twitter_created_at.should == "01-01-2017 01:01".to_datetime
    	@tweet.usuario_id.should == @usuario.id

	end

	it "deve trazer json" do
		Tweet.most_relevants.should == @hash_info.to_json
	end
end