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
  end
end

