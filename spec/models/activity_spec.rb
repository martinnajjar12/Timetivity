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

  describe '.not' do
    it 'should exclude the given group' do
      john = User.create(name: 'John', email: 'john@example.com', password: 'password')
      group_test = Group.create(name: 'Test', user_id: john.id)
      activity_test = Activity.create(name: 'test', user_id: john.id, group_id: group_test.id, time: 1.5)
      expect(Activity.not(group_test.id)).not_to include(activity_test)
    end
  end
end
