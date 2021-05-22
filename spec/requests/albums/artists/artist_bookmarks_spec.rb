require 'rails_helper'

RSpec.describe "/artist_bookmarks", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      ArtistBookmark.create! valid_attributes
      get artist_bookmarks_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      artist_bookmark = ArtistBookmark.create! valid_attributes
      get artist_bookmark_url(artist_bookmark), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ArtistBookmark" do
        expect {
          post artist_bookmarks_url,
               params: { artist_bookmark: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ArtistBookmark, :count).by(1)
      end

      it "renders a JSON response with the new artist_bookmark" do
        post artist_bookmarks_url,
             params: { artist_bookmark: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ArtistBookmark" do
        expect {
          post artist_bookmarks_url,
               params: { artist_bookmark: invalid_attributes }, as: :json
        }.to change(ArtistBookmark, :count).by(0)
      end

      it "renders a JSON response with errors for the new artist_bookmark" do
        post artist_bookmarks_url,
             params: { artist_bookmark: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested artist_bookmark" do
        artist_bookmark = ArtistBookmark.create! valid_attributes
        patch artist_bookmark_url(artist_bookmark),
              params: { artist_bookmark: new_attributes }, headers: valid_headers, as: :json
        artist_bookmark.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the artist_bookmark" do
        artist_bookmark = ArtistBookmark.create! valid_attributes
        patch artist_bookmark_url(artist_bookmark),
              params: { artist_bookmark: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the artist_bookmark" do
        artist_bookmark = ArtistBookmark.create! valid_attributes
        patch artist_bookmark_url(artist_bookmark),
              params: { artist_bookmark: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested artist_bookmark" do
      artist_bookmark = ArtistBookmark.create! valid_attributes
      expect {
        delete artist_bookmark_url(artist_bookmark), headers: valid_headers, as: :json
      }.to change(ArtistBookmark, :count).by(-1)
    end
  end
end
