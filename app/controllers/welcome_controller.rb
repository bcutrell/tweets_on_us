class WelcomeController < ApplicationController

  def index
    @tweeter = Tweeter.handle_check(params)
    @group = Group.tag_check(params)
    @group_tweets = Group.tweeter_tweets_count
  end

end
