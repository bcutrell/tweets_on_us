class WelcomeController < ApplicationController

  def index
    if params[:handle].present?
      @tweeter = Tweeter.where(id: params[:handle][:tweeter_id]).first
    elsif params[:tag].present?
      @group = Group.where(id: params[:tag][:group_id]).first
    end
    @group_tweets = Group.tweeter_tweets_count
  end

end
