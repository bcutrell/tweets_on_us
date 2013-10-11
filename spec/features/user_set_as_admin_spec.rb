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

  scenario 'admin can see special admin site' do
    user = FactoryGirl.create(:administrator)
    login_with_oauth
    click_on 'Admin'
    expect(page).to have_content('Site Administration')
  end

  scenario 'normal users cannot see admin site' do
    user = FactoryGirl.create(:user)
    login_with_oauth
    expect(page).to_not have_content('Admin')
  end

  # scenario 'admin removes tweeter'
  
end
