require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  context 'GET #show' do

    it 'return a success response ' do
      # user = User.create!(nickname: 'sim', email: 'sim@email.com', category: 'Financial', password: '123456')
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end
end