require 'spec_helper'

feature 'user is set as an admin', %Q{
  As an admin
  I want to seed a given database with sidekiq
  So that I can avoid rate limits
} do

# Acceptance Criteria
# * I use sidekiq to pull from the api and seed the database
# * I use tweeter handles to specify which accounts I want to pull data from
# * Data is pulled every 4 hours
# * Data older than 30 days is removed



  scenario 'I seed the tweet model with sidekiq' do
    # expect(Tweet.count).to eql(0)

    # expect(page).to have_content()
  end

  scenario 'db removes tweets 30 days plus' do
    prev_tweet_count = Tweet.count
    kevin = FactoryGirl.create(:tweeter, :with_tweet)
    first_tweet = kevin.tweets.first
    first_tweet.tweet_date = Date.today - 32
    first_tweet.save!

    expect(Tweet.count).to eql(prev_tweet_count + 1)

    TweeterWorker.perform_async(kevin.id)

    expect(Tweet.all).to_not include(first_tweet)
  end

end
