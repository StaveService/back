require 'rails_helper'

RSpec.describe Users::UserRelationshipsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'users/1/relationships').to route_to('users/user_relationships#create', user_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'users/1/relationships/1').to route_to('users/user_relationships#destroy', user_id: '1', id: '1')
    end
  end
end
