require 'rails_helper'

RSpec.describe '/composer_musics', type: :request do
  let(:user) { create(:user) }
  let(:music) { create(:music, user: user) }
  let(:artist) { create(:artist) }
  let(:composer_music) { create(:composer_music, artist: artist, music: music) }

  context 'POST /composer_musics' do
    context 'with Authorization header' do
      before do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end

      it do
        post user_music_composer_musics_path(user_id: user.id, music_id: music.id),
             params: { composer_music: artist.attributes }, headers: @headers
        expect(response).to have_http_status :created
      end
    end

    it 'without Authorization header' do
      post user_music_composer_musics_path(user_id: user.id, music_id: music.id),
           params: { composer_music: artist.attributes }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'DELETE /composer_album' do
    context 'with Authorization header' do
      before do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end

      it do
        composer_music
        delete user_music_composer_music_path(user_id: user.id, music_id: music.id, id: artist.id), headers: @headers
        expect(response).to have_http_status :no_content
      end
    end

    it 'without Authorization header' do
      composer_music
      delete user_music_composer_music_path(user_id: user.id, music_id: music.id, id: artist.id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
