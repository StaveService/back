require "rails_helper"

RSpec.describe LyristsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lyrists").to route_to("lyrists#index")
    end

    it "routes to #show" do
      expect(get: "/lyrists/1").to route_to("lyrists#show", id: "1")
    end
  end
end
