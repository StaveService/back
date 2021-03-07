require "rails_helper"

RSpec.describe ArtistsController, type: :routing do
  describe "/artist routing" do
    it "routes to #index" do
      expect(get: "/artists").to route_to("artists#index")
    end

    it "routes to #show" do
      expect(get: "/artists/1").to route_to("artists#show", id: "1")
    end


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

  describe "/artist/album routing" do
    it "routes to #index" do
      expect(get: "/artists/1/albums").to route_to("artists/albums#index", artist_id: "1")
    end

    it "routes to #show" do
      expect(get: "/artists/1/albums/1").to route_to("artists/albums#show", artist_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "/artists/1/albums").to route_to("artists/albums#create", artist_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/artists/1/albums/1").to route_to("artists/albums#update", artist_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/artists/1/albums/1").to route_to("artists/albums#update", artist_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/artists/1/albums/1").to route_to("artists/albums#destroy", artist_id: "1", id: "1")
    end
  end

  describe "/artist/album/music routing" do
    it "routes to #index" do
      expect(get: "/artists/1/albums/1/musics").to route_to("artists/albums/musics#index", artist_id: "1", album_id: "1")
    end

    it "routes to #show" do
      expect(get: "/artists/1/albums/1/musics/1").to route_to("artists/albums/musics#show", artist_id: "1", album_id: "1", id: "1")
    end
  end

  describe "/artist/music routing" do
    it "routes to #index" do
      expect(get: "/artists/1/musics").to route_to("artists/musics#index", artist_id: "1")
    end

    it "routes to #show" do
      expect(get: "/artists/1/musics/1").to route_to("artists/musics#show", artist_id: "1", id: "1")
    end
  end
end
