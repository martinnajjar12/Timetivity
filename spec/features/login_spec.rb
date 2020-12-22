require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'john@example.com', password: 'password', name: 'John')
  end
  it 'signs John in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end
end
