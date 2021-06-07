require 'rails_helper'

RSpec.describe 'Albums::ArtistAlbums', type: :request do
  let(:user) { create(:user) }
  let(:artist) { create(:artist) }
  let(:band) { create(:band) }
  let(:artist_band) { create(:artist_band, band: band, artist: artist) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'POST /bands/artists' do
    it 'with headers' do
      post band_artist_bands_path(band_id: band.id), params: { artist_band: { artist_id: artist.id } },
                                                     headers: headers
      expect(response).to have_http_status :created
    end

    it 'without headers' do
      post band_artist_bands_path(band_id: band.id), params: { artist_band: { artist_id: artist.id } }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'DELETE /bands/artists' do
    context 'with Authorization header' do
      it do
        delete band_artist_band_path(band_id: artist_band.band_id, id: artist_band.artist_id),
               headers: headers
        expect(response).to have_http_status :no_content
      end

      it 'without headers' do
        delete band_artist_band_path(band_id: artist_band.band_id, id: artist_band.artist_id)
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
