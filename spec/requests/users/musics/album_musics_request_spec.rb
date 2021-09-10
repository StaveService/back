require 'rails_helper'

RSpec.describe 'Users::Musics::AlbumMusics', type: :request do
  let(:user) { create(:user) }
  let(:album) { create(:album) }
  let(:music) { create(:music, user: user) }
  let(:album_music) { create(:album_music, music: music, album: album) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /users/musics/albums' do
    context 'with Authorization header' do
      it do
        post user_music_album_musics_path(user_id: user.id, music_id: music.id), params: { album_id: album.id },
                                                                                 headers: headers
        expect(response).to have_http_status :created
      end

      it 'without album_id' do
        post user_music_album_musics_path(user_id: user.id, music_id: music.id),
             headers: headers
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'without headers' do
        post user_music_album_musics_path(user_id: user.id, music_id: music.id), params: { album_id: album.id }
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  context 'when DELETE /users/musics/albums' do
    context 'with Authorization header' do
      it do
        delete user_music_album_music_path(user_id: user.id, music_id: album_music.music_id, id: album_music.album_id),
               headers: headers
        expect(response).to have_http_status :no_content
      end

      it 'without headers' do
        delete user_music_album_music_path(user_id: user.id, music_id: album_music.music_id, id: album_music.album_id)
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
