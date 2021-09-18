require 'rails_helper'

RSpec.describe 'Albums::ArtistAlbums', type: :request do
  let(:user) { create(:user) }
  let(:artist) { create(:artist) }
  let(:album) { create(:album) }
  let(:artist_album) { create(:artist_album, artist: artist, album: album) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /albums/artists' do
    it 'with headers' do
      post album_artist_albums_path(album_id: album.id), params: { artist_album: { artist_id: artist.id } },
                                                         headers: headers
      expect(response).to have_http_status :created
    end

    it 'without headers' do
      post album_artist_albums_path(album_id: album.id), params: { artist_album: { artist_id: artist.id } }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when DELETE /albums/artists' do
    it 'with Authorization header' do
      delete album_artist_album_path(album_id: artist_album.album_id, id: artist_album.artist_id),
             headers: headers
      expect(response).to have_http_status :no_content
    end

    it 'without headers' do
      delete album_artist_album_path(album_id: artist_album.album_id, id: artist_album.artist_id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
