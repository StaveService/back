require 'rails_helper'

RSpec.describe Albums::ArtistAlbumsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/albums/1/artists').to route_to('albums/artist_albums#create', album_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1/artists/1').to route_to('albums/artist_albums#destroy', album_id: '1', id: '1')
    end
  end
end
