require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  let(:user) { create(:user) }
  let(:album) { create(:album) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when POST /albums' do
    context 'with Authorization header' do
      it do
        post albums_path, params: { album: attributes_for(:album), locale: 'ja' }, headers: headers
        expect(response).to have_http_status :created
      end

      it 'without name' do
        post albums_path, params: { album: attributes_for(:album, :without_title), locale: 'ja' }, headers: headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    it 'without Authorization header' do
      post albums_path, params: { album: attributes_for(:album), locale: 'ja' }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when PUT /albums' do
    it 'with Authorization header' do
      put album_path(album), params: { album: attributes_for(:album), locale: 'ja' }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      put album_path(album), params: { album: attributes_for(:album), locale: 'ja' }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when PATCH /albums' do
    it 'with Authorization header' do
      patch album_path(album), params: { album: attributes_for(:album), locale: 'ja' }, headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      patch album_path(album), params: { album: attributes_for(:album), locale: 'ja' }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when DELETE /albums' do
    context 'with Authorization header' do
      it do
        delete album_path(album), headers: headers
        expect(response).to have_http_status :no_content
      end
    end

    it 'without Authorization header' do
      delete album_path(album)
      expect(response).to have_http_status :unauthorized
    end
  end
end
