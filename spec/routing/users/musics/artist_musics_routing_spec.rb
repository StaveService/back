require "rails_helper"

RSpec.describe Users::Musics::ArtistMusicsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "users/1/musics/1/artist_musics").to route_to("users/musics/artist_musics#create", user_id: "1", music_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "users/1/musics/1/artist_musics/1").to route_to("users/musics/artist_musics#destroy", user_id: "1", music_id: "1", id: "1")
    end
  end
end
