require "rails_helper"

RSpec.describe Users::Musics::ComposerMusicsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/users/1/musics/1/composer_musics").to route_to("users/musics/composer_musics#create", user_id: "1", music_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/musics/1/composer_musics/1").to route_to("users/musics/composer_musics#destroy",user_id: "1", music_id: "1", id: "1")
    end
  end
end
