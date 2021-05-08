require "rails_helper"

RSpec.describe LyristMusicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lyrist_musics").to route_to("lyrist_musics#index")
    end

    it "routes to #show" do
      expect(get: "/lyrist_musics/1").to route_to("lyrist_musics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lyrist_musics").to route_to("lyrist_musics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lyrist_musics/1").to route_to("lyrist_musics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lyrist_musics/1").to route_to("lyrist_musics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lyrist_musics/1").to route_to("lyrist_musics#destroy", id: "1")
    end
  end
end
