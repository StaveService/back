require 'rails_helper'

RSpec.describe Albums::AlbumLinksController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PUT' do
      expect(put: 'albums/1/links/1').to route_to('albums/album_links#update', album_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'albums/1/links/1').to route_to('albums/album_links#update', album_id: '1', id: '1')
    end
  end
end
