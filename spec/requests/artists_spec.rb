require 'rails_helper'


RSpec.describe "Artists", type: :request do
  describe "/artist" do
    let(:artist_valid_attributes){ {name: Faker::Name.name} }
    context "GET /artists" do
      it { is_expected.to eq(200) }
    end

    context "POST /artists" do
      before do
        params[:artist] = artist_valid_attributes
      end
      it { is_expected.to eq(201) }
    end

    context "GET /artists/:artist_id" do
      let(:artist_id) { create(:artist).id }
      it { is_expected.to eq(200) }
    end


    context "PATCH /artists/:artist_id" do
      let(:artist_id) { create(:artist).id }
      before do
        params[:artist] = artist_valid_attributes
      end
      it { is_expected.to eq(200) }
    end

    context "PUT /artists/:artist_id" do
      let(:artist_id) { create(:artist).id }
      before do
        params[:artist] = artist_valid_attributes
      end
      it { is_expected.to eq(200) }
    end

    context "DELETE /artists/:artist_id" do
      let(:artist_id) { create(:artist).id }
      before do
        params[:artist] = artist_valid_attributes
      end
      it { is_expected.to eq(204) }
    end
  end
  
  describe "/artist/music" do
    let(:artist) { create(:artist) }
    let(:artist_id) { artist.id }

    context "GET /artists/:artist_id/musics" do
      it { is_expected.to eq(200) }
    end

    context "GET /artists/:artist_id/musics/:music_id" do
      let!(:artist_music) { create(:artist_music, music: music, artist: artist)}
      let(:music) { create(:music) }
      let(:music_id) { music.id }
      it { is_expected.to eq(200) }
    end
  end
end

