module Seeders
  module Tweets

    class << self

      def seed
        Tweeter.all.each do |tweeter|
          tweet(tweeter.handle)
          @tweets.each do |tweet|
            if !Tweet.where(content: tweet[:text]).present?
            message = Tweet.new(content: tweet[:text], tweeter: tweeter, tweet_date: tweet[:created_at])
            message.save!
            end
          end
        end
      end

      def tweet(handle)
        @tweets = []
        fetch_all_tweets(handle).each do |tweet|
          @tweets << {text: tweet.text, created_at: tweet.created_at}
        end
      end

      def collect_with_max_id(collection=[], max_id=nil, &block)
        response = yield max_id
        collection += response
        response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
      end

      def fetch_all_tweets(user)
        collect_with_max_id do |max_id|
          options = {:count => 200, :include_rts => true}
          options[:max_id] = max_id unless max_id.nil?
          Twitter.user_timeline(user, options)
        end
      end

    end
  end
end
