require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when PATCH /users' do
    it 'with Authorization header' do
      patch user_path(user), params: { user: attributes_for(:user) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      patch user_path(user), params: { user: attributes_for(:user) }
      expect(response).to have_http_status :unauthorized
    end
  end
end
