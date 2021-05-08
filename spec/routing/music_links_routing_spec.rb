require "rails_helper"

RSpec.describe MusicLinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/music_links").to route_to("music_links#index")
    end

    it "routes to #show" do
      expect(get: "/music_links/1").to route_to("music_links#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/music_links").to route_to("music_links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/music_links/1").to route_to("music_links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/music_links/1").to route_to("music_links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/music_links/1").to route_to("music_links#destroy", id: "1")
    end
  end
end
