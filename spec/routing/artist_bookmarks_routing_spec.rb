require "rails_helper"

RSpec.describe ArtistBookmarksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artist_bookmarks").to route_to("artist_bookmarks#index")
    end

    it "routes to #show" do
      expect(get: "/artist_bookmarks/1").to route_to("artist_bookmarks#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artist_bookmarks").to route_to("artist_bookmarks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artist_bookmarks/1").to route_to("artist_bookmarks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artist_bookmarks/1").to route_to("artist_bookmarks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artist_bookmarks/1").to route_to("artist_bookmarks#destroy", id: "1")
    end
  end
end
