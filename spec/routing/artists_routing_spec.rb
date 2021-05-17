require "rails_helper"

RSpec.describe ArtistsController, type: :routing do
  describe "/artist routing" do
    it "routes to #create" do
      expect(post: "/artists").to route_to("artists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artists/1").to route_to("artists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artists/1").to route_to("artists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artists/1").to route_to("artists#destroy", id: "1")
    end
  end
end
