require 'rails_helper'

RSpec.describe '/album_links', type: :request do
  let(:user) { create(:user) }
  let(:album) { create(:album) }
  let(:album_link) { create(:album_link, album: album) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'PUT /album/links' do
    it 'with Authorization header' do
      put album_album_link_path(album_id: album.id, id: album_link.id),
          params: { album_link: attributes_for(:album_link) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      put album_album_link_path(album_id: album.id, id: album_link.id),
          params: { album_link: attributes_for(:album_link) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'PATCH /album/links' do
    it 'with Authorization header' do
      patch album_album_link_path(album_id: album.id, id: album_link.id),
            params: { album_link: attributes_for(:album_link) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      patch album_album_link_path(album_id: album.id, id: album_link.id),
            params: { album_link: attributes_for(:album_link) }
      expect(response).to have_http_status :unauthorized
    end
  end
end
