require 'spec_helper'

feature 'admin creates tags to categorize tweeters', %Q{
  As an admin
  I want to create groups of twitter users
  So that I can evaluate the groups of data
} do 

  #   Acceptance Critera
  # * I must provide a twitter handle
  # * I must provide a group name
  # * If I have created a group I can see the aggregate data of the group

  scenario 'admin creates a tag' do
    user = FactoryGirl.create(:administrator)
    group_count = Group.count

    login_with_oauth
    click_on 'Admin'
    within('.sidebar-nav') do
      page.click_link('Groups')
    end
    click_on 'Add new'
    fill_in 'Tag', with: 'Fall Launcher'
    click_on 'Save'
    expect(page).to have_content('Group successfully created')
    expect(page).to have_content('Fall Launcher')
    expect(Group.count).to eql(group_count + 1)
  end

  scenario 'admin fails to create a tag' do 
    user = FactoryGirl.create(:administrator)
    group_count = Group.count

    login_with_oauth
    click_on 'Admin'
    within('.sidebar-nav') do
      page.click_link('Groups')
    end
    click_on 'Add new'
    click_on 'Save'
    expect(page).to have_content('Group failed to be created')
    expect(Group.count).to eql(group_count)
  end
end
