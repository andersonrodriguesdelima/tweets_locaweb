require 'rails_helper'

RSpec.describe Usuario, :type => :model do
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
		@hash_info.store('screen_name', "#{@usuario.screen_name}")
        @hash_info.store('url_twitter', "http://twitter.com/#{@usuario.screen_name}")
        @hash_info.store('followers_cont', "#{@usuario.numero_followers}")
        @hash_info.store('retweets', "#{@tweet.retweets}")
        @hash_info.store('favorites_count', "#{@tweet.likes}")
        @hash_info.store('text', "#{@tweet.text}")
        @hash_info.store('created_at', "#{@tweet.twitter_created_at}")
	end

	it "deve cadastrar um usuario" do
    	@usuario.should be_valid
    	@usuario.twitter_id.should == 1
    	@usuario.screen_name.should == "locaweb"
    	@usuario.numero_followers.should == 1000
	end

	it "deve trazer json" do
		Usuario.most_mentions.should == @hash_info.to_json
	end

	it "deve ordenar os usuários por número de followers" do
		@usuario2 = Usuario.new(
    		:twitter_id => 2,
			:screen_name => "locaweb",
			:numero_followers => 900)
    	@usuario2.save!

    	usuarios = Usuario.order_followers
    	usuarios.first.numero_followers.should > usuarios.last.numero_followers
	end
end