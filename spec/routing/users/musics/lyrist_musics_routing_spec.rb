require "rails_helper"

RSpec.describe Users::Musics::LyristMusicsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/users/1/musics/1/lyrist_musics").to route_to("users/musics/lyrist_musics#create", user_id: "1", music_id: "1")
    end
    
    it "routes to #destroy" do
      expect(delete: "/users/1/musics/1/lyrist_musics/1").to route_to("users/musics/lyrist_musics#destroy", user_id: "1", music_id: "1", id: "1")
    end
  end
end
