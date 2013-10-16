class Tweet < ActiveRecord::Base
  
  belongs_to :tweeter

  validates_presence_of :content
  validates_presence_of :tweet_date

  class << self

    def from_today
      Tweet.where(tweet_date: Date.today)
    end

    def tweeter_tag
      Tweet.all.each do |tweet|
        tweet.tweeter
      end
    end

    def time_range
      start_date = Date.today - 30
      end_time = Date.today

    end
  end
end
