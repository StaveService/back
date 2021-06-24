require 'rails_helper'

RSpec.describe Users::UserLinksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/links').to route_to('user_links#index')
    end

    it 'routes to #show' do
      expect(get: '/links/1').to route_to('user_links#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/links').to route_to('user_links#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/links/1').to route_to('user_links#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/links/1').to route_to('user_links#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/links/1').to route_to('user_links#destroy', id: '1')
    end
  end
end
