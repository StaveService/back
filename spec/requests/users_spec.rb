require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "User" do
    context "GET /users" do
      it { is_expected.to eq(200) }
    end

    context "GET /users/:user_id" do
      let(:user_id) { create(:user).id }
      it { is_expected.to eq(200) }
    end
  end

  describe "User/" do
    let(:user) { create(:user) }
    let(:user_id) { user.id }

    describe "Music" do
      context "GET /users/:user_id/musics" do
        it { is_expected.to eq(200) }
      end

      context "GET /users/:user_id/musics/:music_id" do
        let(:music) { create(:music, user: user) }
        let(:music_id) { music.id }
        it { is_expected.to eq(200) }
      end
    end
  end
end
