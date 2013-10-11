require 'spec_helper'

describe Seeders::Tweets do
  let (:seeder) {Seeders::Tweets}

  it 'seeds tweets' do
    seeded_tweet = FactoryGirl.create(:tweeter, :with_tweet).tweets.first.content
    seeder.seed
    expect(Tweet.where(content: seeded_tweet)).to be_present
  end

  it 'does not create duplicates' do
    seeder.seed
    count_after_seed = Tweet.count
    seeder.seed
    expect(Tweet.count).to eql(count_after_seed)
  end

end
