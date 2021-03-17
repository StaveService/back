require "rails_helper"

RSpec.describe LyristsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lyrists").to route_to("lyrists#index")
    end

    it "routes to #show" do
      expect(get: "/lyrists/1").to route_to("lyrists#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lyrists").to route_to("lyrists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lyrists/1").to route_to("lyrists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lyrists/1").to route_to("lyrists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lyrists/1").to route_to("lyrists#destroy", id: "1")
    end
  end
end
