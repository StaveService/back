require 'rails_helper'
RSpec.describe "/bands", type: :request do
  let(:user) { create(:user) }
  let(:band) { create(:band) }
  context "POST /bands" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        post bands_path, params: { band: attributes_for(:band) }, headers: @headers
        expect(response).to have_http_status :created
      end
      it "without name" do
        post bands_path, params: { band: attributes_for(:band, :without_name) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end
    it "without Authorization header" do
      post bands_path, params: { band: attributes_for(:band) }
      expect(response).to have_http_status :unauthorized
    end
  end
  context "PUT /bands" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        put band_path(band), params: { band: attributes_for(:band) }, headers: @headers
        expect(response).to have_http_status :ok
      end
      it "without name" do
        put band_path(band), params: { band: attributes_for(:band, :without_name) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end
    it "without Authorization header" do
        put band_path(band), params: { band: attributes_for(:band) }
        expect(response).to have_http_status :unauthorized
    end
  end
  context "PATCH /bands" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        patch band_path(band), params: { band: attributes_for(:band) }, headers: @headers
        expect(response).to have_http_status :ok
      end
      it "without name" do
        patch band_path(band), params: { band: attributes_for(:band, :without_name) }, headers: @headers
        expect(response).to have_http_status :unprocessable_entity
      end
    end
    it "without Authorization header" do
      patch band_path(band), params: { band: attributes_for(:band) }
      expect(response).to have_http_status :unauthorized
    end
  end
  context "DELETE /bands" do
    context "with Authorization header" do
      before(:each) do
        login user
        @headers = get_auth_params_from_login_response_headers(response)
      end
      it do 
        delete band_path(band), headers: @headers
        expect(response).to have_http_status :no_content
      end
    end
    it "without Authorization header" do
      patch band_path(band), params: { band: attributes_for(:band) }
      expect(response).to have_http_status :unauthorized
    end
  end
end
