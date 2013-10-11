class TweeterWorker
  include Sidekiq::Worker

  def perform(tweeter_id)
    tweeter = Tweeter.find(tweeter_id)
    Twitter.user_timeline(tweeter.handle, trim_user: true, count: 10).each do |timeline|
      start_time = Date.today - 7
      end_time = Date.today 
      tweet_time = Date.parse(timeline.created_at.to_s)
      # find or initialize by, like a seed file, deal with existing tweets
      if tweet_time.between?(start_time, end_time)
        content = timeline.text
        tweet = Tweet.new(content: content, tweeter: tweeter)
        tweet.save
      end
    end
  end

end