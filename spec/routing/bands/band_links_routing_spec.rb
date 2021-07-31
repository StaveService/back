require 'rails_helper'

RSpec.describe Bands::BandLinksController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PUT' do
      expect(put: 'bands/1/links/1').to route_to('bands/band_links#update', band_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'bands/1/links/1').to route_to('bands/band_links#update', band_id: '1', id: '1')
    end
  end
end
