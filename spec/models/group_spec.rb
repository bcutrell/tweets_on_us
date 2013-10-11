require 'spec_helper'

describe Group do
  it { should validate_presence_of :tag }
  it { should validate_uniqueness_of :tag}

  it { should have_many :tweeters }
end
