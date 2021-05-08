require "rails_helper"

RSpec.describe ComposerMusicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/composer_musics").to route_to("composer_musics#index")
    end

    it "routes to #show" do
      expect(get: "/composer_musics/1").to route_to("composer_musics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/composer_musics").to route_to("composer_musics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/composer_musics/1").to route_to("composer_musics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/composer_musics/1").to route_to("composer_musics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/composer_musics/1").to route_to("composer_musics#destroy", id: "1")
    end
  end
end
