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
end
