require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations with group' do
    it { should have_many(:groups) }
  end

  describe 'associations with activity' do
    it { should have_many(:groups) }
  end

  describe 'associations with active_storage' do
    it { should have_one_attached(:avatar) }
  end

  describe 'create external activities group' do
    let(:john) { User.create(name: 'John', email: 'john@example.com', password: 123456) }
    it 'has a group called external group' do
      expect(john.groups.find_by(name: 'External Activities')).not_to be nil
    end
  end
end
