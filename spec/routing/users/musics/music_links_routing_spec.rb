require 'rails_helper'

RSpec.describe Users::Musics::MusicLinksController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/users/1/musics/1/music_links').to route_to('users/musics/music_links#create', user_id: '1',
                                                                                                   music_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/musics/1/music_links/1').to route_to('users/musics/music_links#update', user_id: '1',
                                                                                                    music_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/musics/1/music_links/1').to route_to('users/musics/music_links#update', user_id: '1',
                                                                                                      music_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/musics/1/music_links/1').to route_to('users/musics/music_links#destroy', user_id: '1',
                                                                                                        music_id: '1', id: '1')
    end
  end
end
