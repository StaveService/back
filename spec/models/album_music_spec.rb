require 'rails_helper'

RSpec.describe AlbumMusic, type: :model do
  context "associations" do
    it { should belong_to :album }
    it { belong_to :music }
  end
end
