require 'rails_helper'

describe 'the sign up process', type: :feature do
  it 'signs John up' do
    visit '/users/sign_up'
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('You have signed up successfully')
  end
end
