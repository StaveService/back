require "rails_helper"

RSpec.describe AlbumLinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/album_links").to route_to("album_links#index")
    end

    it "routes to #show" do
      expect(get: "/album_links/1").to route_to("album_links#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/album_links").to route_to("album_links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/album_links/1").to route_to("album_links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/album_links/1").to route_to("album_links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/album_links/1").to route_to("album_links#destroy", id: "1")
    end
  end
end
