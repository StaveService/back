require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "/users routing" do
    it "routes to #index" do
      expect(get: "/users").to route_to("users#index")
    end

    it "routes to #show" do
      expect(get: "/users/1").to route_to("users#show", id: "1")
    end
  end

  describe "/users/musics routing" do
    it "#index" do
      expect(get: "/users/1/musics").to route_to("users/musics#index", user_id: "1")
    end

    it "#show" do
      expect(get: "/users/1/musics/1").to route_to("users/musics#show", user_id: "1", id: "1")
    end

    it "#create" do
      expect(post: "/users/1/musics").to route_to("users/musics#create", user_id: "1")
    end
  end
end
