require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it { is_expected.to eq(200) }
  end
end
