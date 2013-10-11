module Seeders
  module Tweet

    class << self

      def seed
        tweets.each do |tweet|
          tweet = tweet.where(title: attributes[:title]).first
          if tweet.nil?
            tweet = tweet.new
            tweet.content = 
            tweet.tweeter = 

          else
            tweet.update_attributes(attributes)
          end
          tweet.save!
        end
      end

      def tweets

      end

    end
  end
end
