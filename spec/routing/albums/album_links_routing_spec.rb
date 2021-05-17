require "rails_helper"

RSpec.describe Albums::AlbumLinksController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/albums/1/album_links").to route_to("albums/album_links#create", album_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/albums/1/album_links/1").to route_to("albums/album_links#destroy", album_id:"1", id: "1")
    end
  end
end
