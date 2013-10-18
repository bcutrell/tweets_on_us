class WelcomeController < ApplicationController

  def index
    if params[:handle].present?
      @tweeter = Tweeter.where(id: params[:handle][:tweeter_id]).first
    end
    @group_tweets = Group.tweeter_tweets_count
  end

end
