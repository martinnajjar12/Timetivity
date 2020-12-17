require 'rails_helper'

describe ActivityPresenter do
  include ActionView::TestCase::Behavior

  describe 'activity_icon' do
    let(:group) { Group.create(name: 'testing') }
    it 'should return an image tag' do
      activity = ActivityPresenter.new(Activity.new(group_id: group.id), view)
      expect(activity.activity_icon).to include("<img")
    end
  end
end