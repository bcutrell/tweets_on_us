class TweeterWorker
  include Sidekiq::Worker

  def perform(tweeter_id)

    def delete_older_tweets
      Tweet.where("tweet_date < ?", (Date.today - 30)).destroy_all
    end

    def time_range(timeline)
      start_time = Date.today - 30
      end_time = Date.today 
      tweet_time = Date.parse(timeline.created_at.to_s)
      tweet_time.between?(start_time, end_time)
    end

    tweeter = Tweeter.find(tweeter_id)
    Twitter.user_timeline(tweeter.handle, trim_user: true, count: 10).each do |timeline|
      if !Tweet.where(content: timeline.text).present? && time_range(timeline)
        content = timeline.text
        date = Date.parse(timeline.created_at.to_s)
        tweet = Tweet.new(content: content, tweeter: tweeter, tweet_date: date)
        tweet.save
      end
    end
    delete_older_tweets
  end
end
