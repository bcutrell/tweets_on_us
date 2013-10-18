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

    # describe '#cloud_arrar' do
    #   it 'should count all the numbers of words' do
    #     tweeter = FactoryGirl.create(:tweeter, :with_tweet)
    #     expect(tweeter.word_count).to eql(
    #       {text: "Nice", weight:1},
    #       {text: "Tweet", weight:1},
    #       {text: "Today", weight:1})
    #   end
    # end

end
