require "rails_helper"

RSpec.describe BandStarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/band_stars").to route_to("band_stars#index")
    end

    it "routes to #show" do
      expect(get: "/band_stars/1").to route_to("band_stars#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/band_stars").to route_to("band_stars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/band_stars/1").to route_to("band_stars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/band_stars/1").to route_to("band_stars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/band_stars/1").to route_to("band_stars#destroy", id: "1")
    end
  end
end
