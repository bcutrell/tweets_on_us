class Tweeter < ActiveRecord::Base
  has_many :groups,
    through: :tweeter_groups

  has_many :tweeter_groups

  has_many :tweets 

  validates_presence_of :handle


  def self.handles
    handles = []
    Tweeter.all.each do |tweeter|
      handles << tweeter.handle
    end
    handles
  end

  def self.pull_handle_tweet
    #run worker for every handle
    Tweeter.all.each do |tweeter|
      TweeterWorker.perform_async(tweeter.id)
    end
  end


  validates_uniqueness_of :handle

  RailsAdmin.config {|c| c.label_methods << :handle}

end
