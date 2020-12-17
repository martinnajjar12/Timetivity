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
end
