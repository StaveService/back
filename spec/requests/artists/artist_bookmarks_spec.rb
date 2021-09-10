require 'rails_helper'

RSpec.describe '/artist_bookmarks', type: :request do
  let(:current_user) { create(:user) }
  let(:user) { create(:user) }
  let(:artist) { create(:artist) }
  let(:artist_bookmark) { create(:artist_bookmark, user: user, artist: artist) }
  let(:headers) do
    login current_user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /users/artists/artist_bookmarks' do
    it 'with Authorization header' do
      post artist_artist_bookmarks_path(artist_id: artist.id), headers: headers
      expect(response).to have_http_status :created
    end

    it 'without Authorization header' do
      post artist_artist_bookmarks_path(artist_id: artist.id)
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when DELETE /users/artists/artist_bookmarks' do
    it 'with Authorization header' do
      delete artist_artist_bookmark_path(artist_id: artist_bookmark.artist_id, id: artist_bookmark.id),
             headers: headers
      expect(response).to have_http_status :no_content
    end

    it 'without Authorization header' do
      delete artist_artist_bookmark_path(artist_id: artist_bookmark.artist_id, id: artist_bookmark.id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
