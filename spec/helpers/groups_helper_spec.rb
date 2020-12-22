require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  describe '#total_time' do
    it 'returns zero when there are no acitivities' do
      expect(total_time).to eql(0)
    end
  end

  describe '#total_time' do
    it 'returns a Float when there are activities' do
      assign(:group_activities, [Activity.create(name: 'Testing', time: 1.5)])
      expect(helper.total_time).to be_a Float
    end
  end
end
