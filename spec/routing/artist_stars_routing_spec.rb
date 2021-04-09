require "rails_helper"

RSpec.describe ArtistStarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artist_stars").to route_to("artist_stars#index")
    end

    it "routes to #show" do
      expect(get: "/artist_stars/1").to route_to("artist_stars#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artist_stars").to route_to("artist_stars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artist_stars/1").to route_to("artist_stars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artist_stars/1").to route_to("artist_stars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artist_stars/1").to route_to("artist_stars#destroy", id: "1")
    end
  end
end
