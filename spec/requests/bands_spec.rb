require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/bands", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Band. As you add validations to Band, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:band)
  }

  let(:invalid_attributes) {
    attributes_for(:band, name: "")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # BandsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Band.create! valid_attributes
      get bands_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      band = Band.create! valid_attributes
      get band_url(band), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Band" do
        expect {
          post bands_url,
               params: { band: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Band, :count).by(1)
      end

      it "renders a JSON response with the new band" do
        post bands_url,
             params: { band: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Band" do
        expect {
          post bands_url,
               params: { band: invalid_attributes }, as: :json
        }.to change(Band, :count).by(0)
      end

      it "renders a JSON response with errors for the new band" do
        post bands_url,
             params: { band: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:band)
      }

      it "updates the requested band" do
        band = Band.create! valid_attributes
        patch band_url(band),
              params: { band: new_attributes }, headers: valid_headers, as: :json
        band.reload
      end

      it "renders a JSON response with the band" do
        band = Band.create! valid_attributes
        patch band_url(band),
              params: { band: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the band" do
        band = Band.create! valid_attributes
        patch band_url(band),
              params: { band: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested band" do
      band = Band.create! valid_attributes
      expect {
        delete band_url(band), headers: valid_headers, as: :json
      }.to change(Band, :count).by(-1)
    end
  end
end
