require 'spec_helper'

feature 'user is set as an admin', %Q{
  As an admin
  I want to seed a given database with sidekiq
  So that I can avoid rate limits
} do

# Acceptance Criteria
# * I use sidekiq to pull from the api and seed the database
# * I use tweeter handles to specify which accounts I want to pull data from
# * Data is pulled every 4 hours



  scenario 'I seed the tweet model with sidekiq' do
    # visit root_path

    # expect(page).to have_content()
  end

end
