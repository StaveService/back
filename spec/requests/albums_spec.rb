require 'rails_helper'

RSpec.describe "Albums", type: :request do
  describe "/album" do
    context "GET /albums" do
      it { is_expected.to eq(200) }
    end

    context "GET /albums/:album_id" do
      let(:album_id) { create(:album).id }
      it { is_expected.to eq(200) }
    end
  end

  describe "/album/musics" do
    let(:album) { create(:album) }
    let(:album_id) { album.id }
    context "GET /albums/:album_id/musics" do
      it { is_expected.to eq(200) }
    end

    context "GET /albums/:album_id/musics/:music_id" do
      let(:music) { create(:music, album: album) }
      let(:music_id) { music.id }
      it { is_expected.to eq(200) }
    end
  end
end

