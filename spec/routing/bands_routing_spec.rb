require 'rails_helper'

RSpec.describe BandsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/bands').to route_to('bands#index')
    end

    it 'routes to #show' do
      expect(get: '/bands/1').to route_to('bands#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/bands').to route_to('bands#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bands/1').to route_to('bands#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bands/1').to route_to('bands#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bands/1').to route_to('bands#destroy', id: '1')
    end
  end
end
