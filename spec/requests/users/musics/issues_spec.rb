require 'rails_helper'

RSpec.describe '/issues', type: :request do
  let(:user) { create(:user) }
  let(:music) { create(:music, user: user) }
  let(:issue) { create(:issue, music: music, user: user) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /issues' do
    context 'with Authorization header' do
      it do
        post user_music_issues_path(user_id: user.id, music_id: music.id),
             params: { issue: issue.attributes }, headers: headers
        expect(response).to have_http_status :created
      end
    end

    it 'without Authorization header' do
      post user_music_issues_path(user_id: user.id, music_id: music.id),
           params: { issue: issue.attributes }
      expect(response).to have_http_status :unauthorized
    end
  end
end
