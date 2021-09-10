require 'rails_helper'

RSpec.describe '/artist_links', type: :request do
  let(:user) { create(:user) }
  let(:artist) { create(:artist) }
  let(:artist_link) { create(:artist_link, artist: artist) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when PUT /artist/links' do
    it 'with Authorization header' do
      put artist_artist_link_path(artist_id: artist.id, id: artist_link.id),
          params: { artist_link: attributes_for(:artist_link) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      put artist_artist_link_path(artist_id: artist.id, id: artist_link.id),
          params: { artist_link: attributes_for(:artist_link) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when PATCH /artist/links' do
    it 'with Authorization header' do
      patch artist_artist_link_path(artist_id: artist.id, id: artist_link.id),
            params: { artist_link: attributes_for(:artist_link) }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      patch artist_artist_link_path(artist_id: artist.id, id: artist_link.id),
            params: { artist_link: attributes_for(:artist_link) }
      expect(response).to have_http_status :unauthorized
    end
  end
end
