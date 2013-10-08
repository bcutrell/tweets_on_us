require 'spec_helper'

feature 'user is set as an admin', %Q{
  As the admin
  I can regulate tweeters
  So that there is a clean and organized database
} do
  #
  # Acceptance Criteria:
  #
  # * Admin can add/remove tweeters
  # * Admin can create groups for types of tweeters (LA staff, launchers, other)
  # * Admin can set the dashboard feed

  scenario 'user is set as admin' do
    user = FactoryGirl.create(:user)
    user.role = "admin"
    expect(user.role).to eql("admin")
  end

  scenario 'admin adds tweeter'

  scenario 'admin removes tweeter'

end