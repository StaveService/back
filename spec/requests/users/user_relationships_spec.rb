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

RSpec.describe '/user_relationships', type: :request do
  let(:current_user) { create(:user) }
  let(:target_user) { create(:user) }
  let(:user_relationship) { create(:user_relationship, followed: target_user, follower: current_user) }
  let(:headers) do
    login current_user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /users/relationships' do
    it 'with Authorization header' do
      post user_user_relationships_path(user_id: target_user.id), headers: headers
      expect(response).to have_http_status :created
    end

    it 'without Authorization header' do
      post user_user_relationships_path(user_id: target_user.id)
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when DELETE /users/relationships' do
    it 'with Authorization header' do
      delete user_user_relationship_path(user_id: target_user.id, id: user_relationship.id), headers: headers
      expect(response).to have_http_status :no_content
    end

    it 'without Authorization header' do
      delete user_user_relationship_path(user_id: target_user.id, id: user_relationship.id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
