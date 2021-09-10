require 'rails_helper'

RSpec.describe Bands::ArtistBandsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/bands/1/artists').to route_to('bands/artist_bands#create', band_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bands/1/artists/1').to route_to('bands/artist_bands#destroy', band_id: '1', id: '1')
    end
  end
end
