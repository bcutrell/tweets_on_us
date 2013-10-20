require 'spec_helper'

describe Group do
  it { should validate_presence_of :tag }
  it { should validate_uniqueness_of :tag}
  it { should have_many :tweeters }

    describe '#tag_check' do
      it 'returns a string if no tweeter has been selected' do
        params = {}
        params[:group] = nil
        expect(Tweeter.handle_check(params)).to eql(nil)
      end

      it 'returns the tweeter handle if a tweeter has been selected' do
        params = {}
        group = FactoryGirl.create(:group)
        tweeter = FactoryGirl.create(:tweeter, :with_tweet)
        group.tweeters << tweeter
        params[:tag] = {}
        params[:tag][:group_id] = group.id
        expect(Group.tag_check(params)).to eql(group)
      end
    end

end
