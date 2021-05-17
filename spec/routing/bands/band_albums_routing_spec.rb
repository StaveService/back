require "rails_helper"

RSpec.describe Bands::BandAlbumsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/bands/1/band_albums").to route_to("bands/band_albums#create", band_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bands/1/band_albums/1").to route_to("bands/band_albums#destroy", band_id: "1", id: "1")
    end
  end
end
