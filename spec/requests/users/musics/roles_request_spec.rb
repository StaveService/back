require 'rails_helper'

RSpec.describe "Users::Musics::Roles", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/users/musics/roles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/users/musics/roles/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
