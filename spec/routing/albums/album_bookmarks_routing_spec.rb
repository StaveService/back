require 'rails_helper'

RSpec.describe Albums::AlbumBookmarksController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/albums/1/bookmarks').to route_to('albums/album_bookmarks#create', album_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1/bookmarks/1').to route_to('albums/album_bookmarks#destroy', album_id: '1', id: '1')
    end
  end
end
