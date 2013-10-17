class TweetsController < ApplicationController
  def index
    @tweets_from_today = Tweet.from_today
  end
end
