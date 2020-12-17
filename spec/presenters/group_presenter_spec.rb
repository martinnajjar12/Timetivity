require 'rails_helper'

describe GroupPresenter do
  include ActionView::TestCase::Behavior

  describe 'icon' do
    it 'should return an image tag' do
      group = GroupPresenter.new(Group.new, view)
      expect(group.icon).to include("<img")
    end
  end

  describe 'activity_icon' do
    it 'should return an image tag' do
      group = GroupPresenter.new(Group.new, view)
      expect(group.activity_icon).to include("<img")
    end
  end
end