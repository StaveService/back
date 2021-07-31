require 'rails_helper'

RSpec.describe Artists::ArtistLinksController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PUT' do
      expect(put: '/artists/1/links/1').to route_to('artists/artist_links#update', artist_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/artists/1/links/1').to route_to('artists/artist_links#update', artist_id: '1', id: '1')
    end
  end
end
