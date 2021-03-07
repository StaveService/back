require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it { is_expected.to eq(200) }
  end

  describe "GET /users/:user_id" do
    let(:user_id) { create(:user).id }
    it { is_expected.to eq(200) }
  end
end
