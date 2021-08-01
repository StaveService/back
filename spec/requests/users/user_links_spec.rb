require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/user_links', type: :request do
  let(:user) { create(:user)}
  let(:user_link) { create(:user_link, user: user) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'PUT /user/links' do
    it 'with Authorization header' do
      put user_user_link_path(user_id: user.id, id: user_link.id), params: { user_link: attributes_for(:user_link) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      put user_user_link_path(user_id: user.id, id: user_link.id), params: { user_link: attributes_for(:user_link) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'PATCH /user/links' do
    it 'with Authorization header' do
      patch user_user_link_path(user_id: user.id, id: user_link.id), params: { user_link: attributes_for(:user_link) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      patch user_user_link_path(user_id: user.id, id: user_link.id), params: { user_link: attributes_for(:user_link) }
      expect(response).to have_http_status :unauthorized
    end
  end
end