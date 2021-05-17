require "rails_helper"

RSpec.describe Users::Musics::IssuesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/1/musics/1/issues").to route_to("users/musics/issues#index", user_id: "1", music_id: "1")
    end

    it "routes to #show" do
      expect(get: "/users/1/musics/1/issues/1").to route_to("users/musics/issues#show", user_id: "1", music_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/users/1/musics/1/issues").to route_to("users/musics/issues#create", user_id: "1", music_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/1/musics/1/issues/1").to route_to("users/musics/issues#update", user_id: "1", music_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/1/musics/1/issues/1").to route_to("users/musics/issues#update", user_id: "1", music_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/musics/1/issues/1").to route_to("users/musics/issues#destroy", user_id: "1", music_id: "1", id: "1")
    end
  end
end
