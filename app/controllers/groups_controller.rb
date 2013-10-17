class GroupsController < ApplicationController
  def index
    @group_tweets = Group.tweeter_tweets_count
  end
end
