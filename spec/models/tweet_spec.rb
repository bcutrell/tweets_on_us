require 'spec_helper'

describe Tweet do
  it { should validate_presence_of :content }
  it { should validate_presence_of :tweet_date }

  it 'should see tweets from today only' do
    
    Timecop.freeze(Time.now) do
      tweet_from_today = FactoryGirl.create(:tweet, :today)
      tweet_from_yesterday = FactoryGirl.create(:tweet, :yesterday)
      Tweet.from_today
      
      expect(Tweet.from_today).to include(tweet_from_today)
      expect(Tweet.from_today).to_not include(tweet_from_yesterday)
    end
    

  end
end
