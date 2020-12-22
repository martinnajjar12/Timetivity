require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations with user' do
    it { should belong_to(:user) }
  end

  describe 'associations with activity' do
    it { should have_many(:activities) }
  end

  describe 'associations with active_storage' do
    it { should have_one_attached(:icon) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe '.ordered_alphabetically' do
    it 'should order the groups alphabetically' do
      john = User.create(name: 'John', email: 'john@example.com', password: 'password')
      test = Group.create(name: 'test', user_id: john.id)
      external_activities = Group.find_by(name: 'External Activities')
      coding = Group.create(name: 'coding', user_id: john.id)
      expect(Group.all.ordered_alphabetically).to match([coding, external_activities, test])
    end
  end
end
