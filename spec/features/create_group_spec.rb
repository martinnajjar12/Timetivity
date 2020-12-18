require 'rails_helper'

describe 'the create group process', type: :feature do
  before :each do
    User.create(email: 'john@example.com', password: 'password', name: 'John')
  end

  it 'creates a group' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
    visit '/users/1/groups/new'
    expect(page).to have_text('Create a new group')
    fill_in 'group_name', with: 'test'
    click_button 'Create a group'
    expect(page).to have_text('Group has been successfully created!')
  end
end