class Group < ActiveRecord::Base
  has_many :tweeters,
    through: :tweeter_groups
  has_many :tweeter_groups

  validates_presence_of :tag
  validates_uniqueness_of :tag

RailsAdmin.config {|c| c.label_methods << :tag}

  def tweet_count
    tweet_count = 0
    self.tweeters.each do |tweeter|
      tweet_count += tweeter.tweets.count
    end
    tweet_count
  end

  def self.tweeter_tweets_count
    group_tweet_count = {}
    self.all.each do |group|
      group_tweet_count[group.tag] = group.tweet_count
    end
    group_tweet_count
  end

end
