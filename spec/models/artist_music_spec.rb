require 'rails_helper'

RSpec.describe ArtistMusic, type: :model do
  context 'associations' do
    it { should belong_to :artist}
    it { should belong_to :music }
  end
  context "attributes" do
    it "has role" do
      expect(build(:artist_music, role: 0)).to have_attributes(role: "vocal")
    end
  end
end
