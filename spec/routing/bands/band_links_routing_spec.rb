require "rails_helper"

RSpec.describe Bands::BandLinksController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "bands/1/band_links").to route_to("bands/band_links#create", band_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "bands/1/band_links/1").to route_to("bands/band_links#update", band_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "bands/1/band_links/1").to route_to("bands/band_links#update", band_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "bands/1/band_links/1").to route_to("bands/band_links#destroy", band_id: "1", id: "1")
    end
  end
end
