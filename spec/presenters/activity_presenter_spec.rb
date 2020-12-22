require 'rails_helper'

describe ActivityPresenter do
  include ActionView::TestCase::Behavior

  describe 'activity_icon' do
    it 'should return an image tag' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')
      group = Group.create(name: 'Test', user_id: user.id)
      activity = ActivityPresenter.new(Activity.new(group_id: group.id), view)
      expect(activity.activity_icon).to include('<img')
    end
  end
end
