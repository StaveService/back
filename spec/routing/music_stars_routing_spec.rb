require "rails_helper"

RSpec.describe MusicStarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/music_stars").to route_to("music_stars#index")
    end

    it "routes to #show" do
      expect(get: "/music_stars/1").to route_to("music_stars#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/music_stars").to route_to("music_stars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/music_stars/1").to route_to("music_stars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/music_stars/1").to route_to("music_stars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/music_stars/1").to route_to("music_stars#destroy", id: "1")
    end
  end
end
