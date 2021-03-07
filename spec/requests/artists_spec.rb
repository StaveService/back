require 'rails_helper'


RSpec.describe "Artists", type: :request do
  let(:valid_attributes){ {name: Faker::Name.name} }

  context "GET /artists" do
    it { is_expected.to eq(200) }
  end

  context "POST /artists" do
    before do
      params[:artist] = valid_attributes
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
      params[:artist] = valid_attributes
    end
    it { is_expected.to eq(200) }
  end

  context "PUT /artists/:artist_id" do
    let(:artist_id) { create(:artist).id }
    before do
      params[:artist] = valid_attributes
    end
    it { is_expected.to eq(200) }
  end

  context "DELETE /artists/:artist_id" do
    let(:artist_id) { create(:artist).id }
    before do
      params[:artist] = valid_attributes
    end
    it { is_expected.to eq(204) }
  end
  
  describe "Album" do
    let(:artist_id) { create(:artist).id }

    context "GET /artists/:artist_id/musics" do
      before do
        params[:artist] = valid_attributes
      end
      it { is_expected.to eq(200) }
    end
  end

end

