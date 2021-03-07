require 'rails_helper'

RSpec.describe "Artists", type: :request do
  describe "GET /artists" do
    it { is_expected.to eq(200) }
  end
end

