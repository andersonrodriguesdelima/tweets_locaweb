require 'rails_helper'

RSpec.describe Twitter, :type => :model do
	before(:each) do
	end

	it "deve buscar os tweets no link e cadastrar tweets" do
		quantidade_tweets = Tweet.all.size
		quantidade_tweets.should == 0

		Twitter.find_tweets

		Tweet.all.size.should > quantidade_tweets
	end

	it "deve buscar os tweets no link e cadastrar usuarios" do
		quantidade_usuarios = Usuario.all.size
		quantidade_usuarios.should == 0

		Twitter.find_tweets

		Usuario.all.size.should > quantidade_usuarios
	end
end