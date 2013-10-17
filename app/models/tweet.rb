class Tweet < ActiveRecord::Base
  
  belongs_to :tweeter

  validates_presence_of :content
  validates_presence_of :tweet_date

  class << self

    def from_today
      Tweet.where(tweet_date: Date.today)
    end
    
  end
end
