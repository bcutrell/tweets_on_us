require 'spec_helper'

feature 'user signs in through twitter', %Q{
As a twitter user
I want to sign in through twitter
So that I can provide authentication to the API
} do 

# Acceptance Criteria
# * I must have a twitter account

  scenario 'I sign in successfully' do 
    login_with_oauth
    
    page.should have_content("Sign out")
  end 

  scenario 'I fail to sign in' do 
      login_with_oauth(:invalid)  
      
      page.should have_content('Authentication failed, please try again.')
  end


end

