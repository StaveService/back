require "rails_helper"

RSpec.describe MusicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/musics").to route_to("musics#index")
    end

    it "routes to #show" do
      expect(get: "/musics/1").to route_to("musics#show", id: "1")
    end

    # it "routes to #create" do
      # expect(post: "/musics").to route_to("musics#create")
    # end

    # it "routes to #update via PUT" do
      # expect(put: "/musics/1").to route_to("musics#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
      # expect(patch: "/musics/1").to route_to("musics#update", id: "1")
    # end

    # it "routes to #destroy" do
      # expect(delete: "/musics/1").to route_to("musics#destroy", id: "1")
    # end
  end
end
