require 'rails_helper'

RSpec.describe ProcurementLotsController, type: :controller do
  describe 'GET #index' do
    it 'responds with the index template' do
      log_in create(:user)
      get :index
      expect(response).to render_template(:index)
    end
  end
end
