require 'rails_helper'

RSpec.describe Bands::BandBookmarksController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/bands/1/band_bookmarks').to route_to('bands/band_bookmarks#create', band_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bands/1/band_bookmarks/1').to route_to('bands/band_bookmarks#destroy', band_id: '1', id: '1')
    end
  end
end
