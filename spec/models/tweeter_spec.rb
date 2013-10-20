require 'spec_helper'

describe Tweeter do
  it { should validate_presence_of :handle }
  it { should validate_uniqueness_of :handle}

  it { should have_many :groups }

  it "should return an array of twitter handles" do
    tweeter = FactoryGirl.create(:tweeter)
    expect(Tweeter.handles.class).to eql(Array)
    expect(Tweeter.handles).to eql([tweeter.handle])
  end

    describe '#handle_words' do
      it 'creates an array of words from a tweet of a given handle' do
        tweeter = FactoryGirl.create(:tweeter, :with_tweet)
        tweet = tweeter.tweets.first.content.split(" ")
        result = Hash.new(0)
        tweet.each { |word| result[word] += 1 }

        expect(tweeter.handle_words).to eql(result)
      end

      it 'creates an array of words from all of the tweets of a given handle' do
        tweeter = FactoryGirl.create(:tweeter, :with_tweet)
        new_tweet = FactoryGirl.create(:tweet, content: "Kim Kardashian is so last year")
        tweeter.tweets << new_tweet
        expect(tweeter.handle_words.class).to eql(Hash)
      end
    end

    describe '#handle_check' do
      it 'returns a string if no tweeter has been selected' do
        params = {}
        params[:handle] = nil
        expect(Tweeter.handle_check(params)).to eql(nil)
      end

      it 'returns the tweeter handle if a tweeter has been selected' do
        params = {}
        tweeter = FactoryGirl.create(:tweeter, :with_tweet)
        params[:handle] = {}
        params[:handle][:tweeter_id] = tweeter.id
        expect(Tweeter.handle_check(params)).to eql(tweeter)
      end
    end

end
