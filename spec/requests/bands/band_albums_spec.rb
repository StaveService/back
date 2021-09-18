require 'rails_helper'

RSpec.describe '/band_artists', type: :request do
  let(:user) { create(:user) }
  let(:album) { create(:album) }
  let(:band) { create(:band) }
  let(:band_album) { create(:band_album, band: band, album: album) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /bands/albums' do
    it 'with headers' do
      post band_band_albums_path(band_id: band.id), params: { band_album: { album_id: album.id } },
                                                     headers: headers
      expect(response).to have_http_status :created
    end

    it 'without headers' do
      post band_band_albums_path(band_id: band.id), params: { band_album: { album_id: album.id } }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when DELETE /bands/albums' do
    it 'with Authorization header' do
      delete band_band_album_path(band_id: band_album.band_id, id: band_album.album_id),
              headers: headers
      expect(response).to have_http_status :no_content
    end

    it 'without headers' do
      delete band_band_album_path(band_id: band_album.band_id, id: band_album.album_id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
