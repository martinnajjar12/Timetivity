require 'rails_helper'

RSpec.describe ActivitiesHelper, type: :helper do
  include Devise::Test::ControllerHelpers
  before :each do
    @user = User.create(email: 'john@example.com', password: 'password', name: 'John')
    sign_in @user
  end

  describe '#activities_total_time' do
    it 'returns 0 when there is no activities' do
      expect(activities_total_time).to eq(0)
    end
  end

  describe '#activities_total_time' do
    it 'returns a Float when there are activities' do
      assign(:activities, [Activity.create(name: 'Testing', time: 1.5)])
      expect(helper.activities_total_time).to be_a Float
    end
  end

  describe '#external_group_id' do
    it 'returns an integer' do
      expect(helper.external_group_id).to be_an Integer
    end
  end
end
