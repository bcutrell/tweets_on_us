class TweeterWorker
  include Sidekiq::Worker

  def perform(tweeter_id)
    tweeter = Tweeter.find(tweeter_id)
    Twitter.user_timeline(tweeter.handle, trim_user: true, count: 10).each do |timeline|
      if !Tweet.where(content: timeline.text).present?    
        content = timeline.text
        date = Date.parse(timeline.created_at.to_s)
        tweet = Tweet.new(content: content, tweeter: tweeter, tweet_date: date)
        tweet.save
      end
    end
  end
end
