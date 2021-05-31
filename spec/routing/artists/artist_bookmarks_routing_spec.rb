require 'rails_helper'

RSpec.describe Artists::ArtistBookmarksController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'artists/1/bookmarks').to route_to('artists/artist_bookmarks#create', artist_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'artists/1/bookmarks/1').to route_to('artists/artist_bookmarks#destroy', artist_id: '1',
                                                                                              id: '1')
    end
  end
end
