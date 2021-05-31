require 'rails_helper'

RSpec.describe '/music_bookmarks', type: :request do
  let(:user) { create(:user) }
  let(:current_user) { create(:user) }
  let(:music) { create(:music, user: user) }
  let(:music_bookmark) { create(:music_bookmark, user: user, music: music)}
  let(:headers) do
    login current_user
    get_auth_params_from_login_response_headers(response)
  end

  context 'POST /users/musics/music_bookmarks' do
    it 'with Authorization header' do
        post user_music_music_bookmarks_path(user_id: user.id, music_id: music.id), headers: headers
        expect(response).to have_http_status :created
    end

    it 'without Authorization header' do
      post user_music_music_bookmarks_path(user_id: user.id, music_id: music.id)
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'DELETE /users/musics/music_bookmarks' do
      it 'with Authorization header' do
        delete user_music_music_bookmark_path(user_id: music_bookmark.user_id, music_id: music_bookmark.music_id, id: music_bookmark.id), headers: headers
        expect(response).to have_http_status :no_content
      end

    it 'without Authorization header' do
      delete user_music_music_bookmark_path(user_id: music_bookmark.user_id, music_id: music_bookmark.music_id, id: music_bookmark.id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
