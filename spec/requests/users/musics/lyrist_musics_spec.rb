require 'rails_helper'

RSpec.describe '/lyrist_musics', type: :request do
  let(:user) { create(:user) }
  let(:music) { create(:music, user: user) }
  let(:artist) { create(:artist) }
  let(:lyrist_music) { create(:lyrist_music, artist: artist, music: music) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'POST /lyrist_musics' do
    context 'with Authorization header' do
      it do
        post user_music_lyrist_musics_path(user_id: user.id, music_id: music.id),
             params: { lyrist_music: artist.attributes }, headers: headers
        expect(response).to have_http_status :created
      end
    end

    it 'without Authorization header' do
      post user_music_lyrist_musics_path(user_id: user.id, music_id: music.id),
           params: { lyrist_music: artist.attributes }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'DELETE /lyrist_musics' do
    context 'with Authorization header' do
      it do
        delete user_music_lyrist_music_path(user_id: user.id, music_id: lyrist_music.music_id, id: lyrist_music.artist_id),
               headers: headers
        expect(response).to have_http_status :no_content
      end
    end

    it 'without Authorization header' do
      delete user_music_lyrist_music_path(user_id: user.id, music_id: lyrist_music.music_id,
                                          id: lyrist_music.artist_id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
