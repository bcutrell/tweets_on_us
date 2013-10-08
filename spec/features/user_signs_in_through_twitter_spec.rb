require 'spec_helper'

feature 'user signs in through twitter', %Q{
As a twitter user
I want to sign in through twitter
So that I can provide authentication to the API
} do 

# Acceptance Criteria
# * I must have a twitter account

  scenario 'I sign in successfully' do 
    visit root_path
    mock_auth_hash

    click_on 'Sign in with Twitter'

    page.should have_content("mockuser") 
    page.should have_css('img', :src => 'mock_user_thumbnail_url') 
    page.should have_content("Sign out")
  end 

  scenario 'I fail to sign in' do 
   OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
      visit '/'

      click_on "Sign in with Twitter"
      
      page.should have_content('Authentication failed.')
  end


end

