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
  
end
