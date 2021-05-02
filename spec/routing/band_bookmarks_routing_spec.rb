require "rails_helper"

RSpec.describe BandBookmarksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/band_bookmarks").to route_to("band_bookmarks#index")
    end

    it "routes to #show" do
      expect(get: "/band_bookmarks/1").to route_to("band_bookmarks#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/band_bookmarks").to route_to("band_bookmarks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/band_bookmarks/1").to route_to("band_bookmarks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/band_bookmarks/1").to route_to("band_bookmarks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/band_bookmarks/1").to route_to("band_bookmarks#destroy", id: "1")
    end
  end
end
