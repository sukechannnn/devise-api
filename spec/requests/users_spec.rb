require 'rails_helper'

RSpec.describe 'Users', type: :requests do
  describe 'JWT' do
    context 'GET users/1' do
      before { create(:user) }
      it 'should be valid' do
        # get 'users/1'
        # expect(response.status).to eq(200)
      end
    end
  end
end
