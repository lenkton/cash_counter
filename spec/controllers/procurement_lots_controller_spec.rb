require 'rails_helper'

RSpec.describe ProcurementLotsController, type: :controller do
  let(:user) { create :user }

  before { log_in user }

  describe 'GET #index' do
    it 'responds with the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'responds with the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { procurement_lot: { title: 'title', description: 'alala' } } }
      it 'responds with OK' do
        post :create, params: valid_params
        expect(response).to redirect_to ProcurementLot.last
      end

      it 'creates a lot' do
        expect { post :create, params: valid_params }.to change(ProcurementLot, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { procurement_lot: { title: '' } } }
      it 'responds with unprocessible entity' do
        post :create, params: invalid_params
        expect(response).to be_unprocessable
      end

      it 'does not create a lot' do
        expect { post :create, params: invalid_params }.not_to change(ProcurementLot, :count)
      end
    end
  end
end
