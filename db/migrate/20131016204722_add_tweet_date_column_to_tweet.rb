class AddTweetDateColumnToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_date, :date, null: false
  end
end
