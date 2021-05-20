require 'rails_helper'

RSpec.describe "Albums", type: :request do
  let(:user) { create(:user) }
  let(:album) { create(:album) }
  context "POST /albums" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        post albums_path, params: { album: attributes_for(:album) }, headers: @headers
        expect(response).to have_http_status :created
      end
      it "without name" do
        post albums_path, params: { album: attributes_for(:album, :without_title) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end
    it "without Authorization header" do
      post albums_path, params: { album: attributes_for(:album) }
      expect(response).to have_http_status :unauthorized
    end
  end
  context "PUT /albums" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        put album_path(album), params: { album: attributes_for(:album) }, headers: @headers
        expect(response).to have_http_status :ok
      end
      it "without name" do
        put album_path(album), params: { album: attributes_for(:album, :without_title) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end
    it "without Authorization header" do
        put album_path(album), params: { album: attributes_for(:album) }
        expect(response).to have_http_status :unauthorized
    end
  end
  context "PATCH /albums" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        patch album_path(album), params: { album: attributes_for(:album) }, headers: @headers
        expect(response).to have_http_status :ok
      end
      it "without name" do
        patch album_path(album), params: { album: attributes_for(:album, :without_title) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end
    it "without Authorization header" do
      patch album_path(album), params: { album: attributes_for(:album) }
      expect(response).to have_http_status :unauthorized
    end
  end
  context "DELETE /albums" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        delete album_path(album), headers: @headers
        expect(response).to have_http_status :no_content
      end
    end
    it "without Authorization header" do
      patch album_path(album), params: { album: attributes_for(:album) }
      expect(response).to have_http_status :unauthorized
    end
  end
end

