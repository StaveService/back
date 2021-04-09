require "rails_helper"

RSpec.describe BandAlbumsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/band_albums").to route_to("band_albums#index")
    end

    it "routes to #show" do
      expect(get: "/band_albums/1").to route_to("band_albums#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/band_albums").to route_to("band_albums#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/band_albums/1").to route_to("band_albums#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/band_albums/1").to route_to("band_albums#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/band_albums/1").to route_to("band_albums#destroy", id: "1")
    end
  end
end
