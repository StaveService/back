require "rails_helper"

RSpec.describe ArtistMusicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/artist_musics").to route_to("artist_musics#index")
    end

    it "routes to #show" do
      expect(get: "/artist_musics/1").to route_to("artist_musics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artist_musics").to route_to("artist_musics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/artist_musics/1").to route_to("artist_musics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artist_musics/1").to route_to("artist_musics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artist_musics/1").to route_to("artist_musics#destroy", id: "1")
    end
  end
end
