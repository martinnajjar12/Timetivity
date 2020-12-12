require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'associations with user' do
    it { should belong_to(:user) }
  end

  describe 'associations with group' do
    it { should belong_to(:group) }
  end
end
