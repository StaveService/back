require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  let(:contact) { create(:contact) }
  
  describe 'GET /create' do
    it 'returns http success' do
      post contacts_path, params: { contact: attributes_for(:contact) }
      expect(response).to have_http_status(:success)
    end
  end
end
