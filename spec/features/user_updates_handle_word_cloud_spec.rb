require 'spec_helper'

feature 'user updatedes handle word cloud', %Q{
As a user
I want to update the word cloud
So that I can filter by handle
} do

# Acceptance Criteria
# * I must select a handle
# * I must press the submit button

  scenario 'I update the word cloud' do
    tweeter = FactoryGirl.create(:tweeter, :with_tweet)
    login_with_oauth

    select(tweeter.handle, :from => 'handle[tweeter_id]')
    click_on 'Submit'

    page.has_content?('')
  end
end

