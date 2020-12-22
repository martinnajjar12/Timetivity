require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'callbacks' do
    it { should use_before_action(:authenticate_user!) }
  end
end
