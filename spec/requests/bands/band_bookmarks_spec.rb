require 'rails_helper'

RSpec.describe '/band_bookmarks', type: :request do
  let(:current_user) { create(:user) }
  let(:user) { create(:user) }
  let(:band) { create(:band) }
  let(:band_bookmark) { create(:band_bookmark, user: user, band: band) }
  let(:headers) do
    login current_user
    get_auth_params_from_login_response_headers(response)
  end

  context 'POST /users/bands/band_bookmarks' do
    it 'with Authorization header' do
      post band_band_bookmarks_path(band_id: band.id), headers: headers
      expect(response).to have_http_status :created
    end

    it 'without Authorization header' do
      post band_band_bookmarks_path(band_id: band.id)
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'DELETE /users/bands/band_bookmarks' do
    it 'with Authorization header' do
      delete band_band_bookmark_path(band_id: band_bookmark.band_id, id: band_bookmark.id), headers: headers
      expect(response).to have_http_status :no_content
    end

    it 'without Authorization header' do
      delete band_band_bookmark_path(band_id: band_bookmark.band_id, id: band_bookmark.id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
