require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let(:user) { create :user }
  let(:valid_attributes) { attributes_for :stock }
  let(:stock) { create :stock }

  before { sign_in user }

  describe 'GET #new' do
    before { get :new, params: {} }
    it { expect(response).to be_successful }
  end

  describe 'POST #create' do
    let(:post!) { post :create, params: { stock: attributes } }

    context 'with valid params' do
      let(:attributes) { valid_attributes }
      it { expect { post! }.to change(Stock, :count).by(1) }

      context 'when called' do
        before { post! }

        it { expect(response).to redirect_to(new_stock_path) }
      end
    end
  end
end