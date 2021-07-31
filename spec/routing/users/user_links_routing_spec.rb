require 'rails_helper'

RSpec.describe Users::UserLinksController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PUT' do
      expect(put: '/users/1/links/1').to route_to('users/user_links#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'users/1/links/1').to route_to('users/user_links#update', user_id:'1', id: '1')
    end
  end
end
