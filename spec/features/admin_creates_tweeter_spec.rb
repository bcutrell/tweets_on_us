require 'spec_helper'

feature 'admin creates a tweeter', %Q{
  As the admin
  I can add tweeters
  So that I can follow their tweets
} do 

  # Acceptance Criteria:
  # * Admin can add tweeters
  # * Admin can remove tweeters

before (:each) do 
  @tweet = FactoryGirl.create(:tweeter) 
  @prev_count = Tweeter.count
end

let!(:user) {FactoryGirl.create(:administrator)}

  scenario 'admin successfully creates a tweeter' do
    login_with_oauth
    click_on 'Admin'
    within('.sidebar-nav') do
      page.click_link('Tweeters')
    end
    click_on 'Add new'
    fill_in 'Handle', with: 'wannabefro'
    click_on 'Save'

    expect(page).to have_content("Tweeter successfully created")
    expect(page).to have_content("wannabefro")
    expect(Tweeter.count).to eql(@prev_count + 1)
  end

  scenario 'admin fails to create a tweeter' do
    login_with_oauth
    click_on 'Admin'
    within('.sidebar-nav') do
      page.click_link('Tweeters')
    end
    click_on 'Add new'
    click_on 'Save'

    expect(page).to_not have_content("Tweeter successfully created")
    expect(Tweeter.count).to eql(@prev_count)
  end

  scenario 'admin can\'t create the same tweeter twice' do 
    login_with_oauth
    click_link 'Admin'
    within('.sidebar-nav') do 
      page.click_link('Tweeters')
    end
    click_on 'Add new'
    fill_in 'Handle', with: @tweet.handle
    click_on 'Save'

    expect(page).to have_content("Tweeter failed to be created")
    expect(Tweeter.count).to eql(@prev_count)
  end

  scenario 'admin can delete a tweeter' do 
    login_with_oauth
    click_link 'Admin'
    within('.sidebar-nav') do 
      page.click_link('Tweeters')
    end
    click_on 'Delete'
    click_on 'Yes, I\'m sure'

    expect(page).to have_content('Tweeter successfully deleted')
  end
end
