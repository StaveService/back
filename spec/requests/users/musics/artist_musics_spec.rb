require 'rails_helper'

RSpec.describe '/artist_musics', type: :request do
  let(:user) { create(:user) }
  let(:music) { create(:music, user: user) }
  let(:artist) { create(:artist) }
  let(:roles) { ArtistMusic.roles }
  let(:artist_music) { create(:artist_music, artist: artist, music: music) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /artist_musics' do
    it 'with Authorization header' do
      post user_music_artist_musics_path(user_id: user.id, music_id: music.id),
        params: { artist_music: {role: roles.key(roles[:guitar]), artist_id: artist.id }}, headers: headers
      expect(response).to have_http_status :created
    end

    it 'without Authorization header' do
      post user_music_artist_musics_path(user_id: user.id, music_id: music.id),
           params: { artist_music: { role: roles.key(roles[:guitar]), artist_id: artist.id }}
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when DELETE /artist_music' do
    it 'with Authorization header' do
      delete user_music_artist_music_path(user_id: user.id,
                                            music_id: artist_music.music_id, id: artist_music.id),
              headers: headers
      expect(response).to have_http_status :no_content
    end

    it 'without Authorization header' do
      delete user_music_artist_music_path(user_id: user.id, music_id: artist_music.music_id,
                                            id: artist_music.id)
      expect(response).to have_http_status :unauthorized
    end
  end
end
