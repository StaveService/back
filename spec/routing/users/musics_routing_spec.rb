require "rails_helper"

RSpec.describe Users::MusicsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/users/1/musics").to route_to("users/musics#create", user_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/1/musics/1").to route_to("users/musics#update", user_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/1/musics/1").to route_to("users/musics#update", user_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/musics/1").to route_to("users/musics#destroy", user_id: "1", id: "1")
    end
  end
end
