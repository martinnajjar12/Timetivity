require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'associations with user' do
    it { should belong_to(:user) }
  end

  describe 'associations with group' do
    it { should belong_to(:group) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:group_id) }
    it { should validate_presence_of(:time) }
  end
end
