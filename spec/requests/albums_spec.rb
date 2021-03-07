require 'rails_helper'

RSpec.describe "Albums", type: :request do
  describe "GET /albums" do
    it { is_expected.to eq(200) }
  end
end

