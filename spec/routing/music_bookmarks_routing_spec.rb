require "rails_helper"

RSpec.describe MusicBookmarksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/music_bookmarks").to route_to("music_bookmarks#index")
    end

    it "routes to #show" do
      expect(get: "/music_bookmarks/1").to route_to("music_bookmarks#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/music_bookmarks").to route_to("music_bookmarks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/music_bookmarks/1").to route_to("music_bookmarks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/music_bookmarks/1").to route_to("music_bookmarks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/music_bookmarks/1").to route_to("music_bookmarks#destroy", id: "1")
    end
  end
end
