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

  validates_uniqueness_of :handle

  RailsAdmin.config {|c| c.label_methods << :handle}

    def handle_words
      handle_word_array = []
      self.tweets.each do |tweet|
        tweet.content.split(" ").each do |word|
          handle_word_array << word
        end
      end
      result = Hash.new(0)
      handle_word_array.each { |word| result[word] += 1 }
      return result
    end

    def self.handle_check(params)
      if params[:handle].present?
        @tweeter = Tweeter.where(id: params[:handle][:tweeter_id]).first
      else
        nil
      end
    end

end
