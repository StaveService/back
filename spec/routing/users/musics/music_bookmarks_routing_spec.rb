require "rails_helper"

RSpec.describe Users::Musics::MusicBookmarksController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/users/1/musics/1/music_bookmarks").to route_to("users/musics/music_bookmarks#create", user_id: "1", music_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/musics/1/music_bookmarks/1").to route_to("users/musics/music_bookmarks#destroy", user_id: "1", music_id: "1",id: "1")
    end
  end
end
