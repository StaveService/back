require 'rails_helper'

RSpec.describe Users::UserRelationshipsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/user_relationships').to route_to('user_relationships#index')
    end

    it 'routes to #show' do
      expect(get: '/user_relationships/1').to route_to('user_relationships#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/user_relationships').to route_to('user_relationships#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/user_relationships/1').to route_to('user_relationships#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/user_relationships/1').to route_to('user_relationships#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/user_relationships/1').to route_to('user_relationships#destroy', id: '1')
    end
  end
end
