require 'rails_helper'

RSpec.describe AlbumsController, type: :routing do
  describe '/album routing' do
    it 'routes to #create' do
      expect(post: '/albums').to route_to('albums#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/albums/1').to route_to('albums#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/albums/1').to route_to('albums#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1').to route_to('albums#destroy', id: '1')
    end
  end
end
