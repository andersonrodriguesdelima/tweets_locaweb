class CreateTweets < ActiveRecord::Migration[5.0]
  def self.up
    create_table :tweets do |t|
      t.integer :id_tweet
      t.string :text
      t.integer :user_twitter_id
      t.integer :likes
      t.integer :retweets
      t.datetime :twitter_created_at
      t.references :usuario

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
