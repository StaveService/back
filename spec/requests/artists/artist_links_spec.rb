require 'rails_helper'

RSpec.describe '/artist_links', type: :request do
  let(:user) { create(:user) }
  let(:artist) { create(:artist) }
  let(:artist_link) { create(:artist_link, artist: artist) }

  context 'POST /artists' do
    context 'with Authorization header' do
      before do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end

      it do
        post artists_path, params: { artist: attributes_for(:artist) }, headers: @headers
        expect(response).to have_http_status :created
      end

      it 'without name' do
        post artists_path, params: { artist: attributes_for(:artist, :without_name) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    it 'without Authorization header' do
      post artists_path, params: { artist: attributes_for(:artist) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'PUT /artists' do
    context 'with Authorization header' do
      before do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end

      it do
        put artist_path(artist), params: { artist: attributes_for(:artist) }, headers: @headers
        expect(response).to have_http_status :ok
      end

      it 'without name' do
        put artist_path(artist), params: { artist: attributes_for(:artist, :without_name) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    it 'without Authorization header' do
      put artist_path(artist), params: { artist: attributes_for(:artist) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'PATCH /artists' do
    context 'with Authorization header' do
      before do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end

      it do
        patch artist_path(artist), params: { artist: attributes_for(:artist) }, headers: @headers
        expect(response).to have_http_status :ok
      end

      it 'without name' do
        patch artist_path(artist), params: { artist: attributes_for(:artist, :without_name) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    it 'without Authorization header' do
      patch artist_path(artist), params: { artist: attributes_for(:artist) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'DELETE /artists' do
    context 'with Authorization header' do
      before do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end

      it do
        delete artist_path(artist), headers: @headers
        expect(response).to have_http_status :no_content
      end
    end

    it 'without Authorization header' do
      patch artist_path(artist), params: { artist: attributes_for(:artist) }
      expect(response).to have_http_status :unauthorized
    end
  end
end
