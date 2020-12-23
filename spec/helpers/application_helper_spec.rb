require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  include Devise::Test::ControllerHelpers
  before :each do
    @user = User.create(email: 'john@example.com', password: 'password', name: 'John')
    sign_in @user
  end

  describe '#alert_messages' do
    it 'returns a div with alert-success class' do
      flash[:notice] = 'Test'
      expect(helper.alert_messages).to match(%r{<div class="alert alert-success" role="alert">Test</div>})
    end
  end

  describe '#alert_messages' do
    it 'returns a div with alert-danger class' do
      flash[:alert] = 'Test'
      expect(helper.alert_messages).to match(%r{<div class="alert alert-danger" role="alert">Test</div>})
    end
  end

  describe '#nav_links' do
    it 'returns a span with three links when user is singed in' do
      expect(helper.nav_links).to include('<span class="d-flex"><span><a')
    end
  end

  describe '#nav_links' do
    it 'returns a span with two links when user is not singed in' do
      sign_out @user
      expect(helper.nav_links).to include('<span class="d-flex"><span><a class="nav-link" href="/users/sign_in">Sign')
    end
  end

  describe '#navbar_brand' do
    it 'returns a link with class navbar-brand' do
      sign_out @user
      expect(helper.navbar_brand).to include('<a class="navbar-brand" href="/">Timetivity</a>')
    end
  end

  describe '#user_avatar' do
    it "returns a gravatar if the user doesn't upload a photo" do
      expect(helper.user_avatar).to include('src="http://gravatar.com/avatar')
    end
  end
end
