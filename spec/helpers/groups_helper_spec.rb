require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  describe '#total_time' do
    it 'returns zero when there are no acitivities' do
      expect(total_time).to eql(0)
    end
  end
end
