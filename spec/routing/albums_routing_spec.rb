require "rails_helper"

RSpec.describe AlbumsController, type: :routing do
  describe "/album routing" do
    it "routes to #index" do
      expect(get: "/albums").to route_to("albums#index")
    end

    it "routes to #show" do
      expect(get: "/albums/1").to route_to("albums#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/albums").to route_to("albums#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/albums/1").to route_to("albums#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/albums/1").to route_to("albums#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/albums/1").to route_to("albums#destroy", id: "1")
    end
  end

  describe "/album/music routing" do
    it "routes to #index" do
      expect(get: "/albums/1/musics").to route_to("albums/musics#index", album_id: "1")
    end

    it "routes to #show" do
      expect(get: "/albums/1/musics/1").to route_to("albums/musics#show", album_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "/albums/1/musics").to route_to("albums/musics#create", album_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/albums/1/musics/1").to route_to("albums/musics#update", album_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/albums/1/musics/1").to route_to("albums/musics#update", album_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/albums/1/musics/1").to route_to("albums/musics#destroy", album_id: "1", id: "1")
    end
  end

  
end
