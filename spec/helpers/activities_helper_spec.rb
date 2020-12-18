require 'rails_helper'

RSpec.describe ActivitiesHelper, type: :helper do
  describe '#activities_total_time' do
    it 'returns 0 when there is no activities' do
      expect(activities_total_time).to eq(0)
    end
  end
end
