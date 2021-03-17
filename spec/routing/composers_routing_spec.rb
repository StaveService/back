require "rails_helper"

RSpec.describe ComposersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/composers").to route_to("composers#index")
    end

    it "routes to #show" do
      expect(get: "/composers/1").to route_to("composers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/composers").to route_to("composers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/composers/1").to route_to("composers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/composers/1").to route_to("composers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/composers/1").to route_to("composers#destroy", id: "1")
    end
  end
end
