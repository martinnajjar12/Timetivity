require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  before :each do
    @john = User.create(name: 'John', email: 'john@example.com', password: 'password')
    @group = Group.create(name: 'test', user_id: @john.id)
  end

  describe '.of' do
    it 'returns groups of this user' do
      expect(Group.of(@john)).to include(@group)
    end
  end

  describe '.ordered_by_most_recent' do
    it 'orders the instances by most recent created' do
      external_activities = Group.find_by(name: 'External Activities')
      expect(Group.all.ordered_by_most_recent).to match([@group, external_activities])
    end
  end
end