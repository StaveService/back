require "rails_helper"

RSpec.describe ComposersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/composers").to route_to("composers#index")
    end

    it "routes to #show" do
      expect(get: "/composers/1").to route_to("composers#show", id: "1")
    end
  end
end
