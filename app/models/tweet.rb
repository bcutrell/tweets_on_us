class Tweet < ActiveRecord::Base
  
  belongs_to :tweeter

  validates_presence_of :content
  validates_presence_of :tweet_date

end
