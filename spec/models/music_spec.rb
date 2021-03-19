require 'rails_helper'

RSpec.describe Music, type: :model do
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_most(50) }
  end

  context 'associations' do
    it { should have_many(:music_composers).through(:composers).source(:artist) }
    it { should have_many(:music_lyrists).through(:lyrists).source(:artist) }
    it { should have_many(:artists).through(:artist_musics) }
    it { should belong_to(:user) }
    it { should belong_to(:album).optional }
    it { should belong_to(:band).optional }
  end

  context "attributes" do
    it "has bpm" do
      expect(build(:music, bpm: 120)).to have_attributes(bpm: 120)
    end

    it "has time" do
      expect(build(:music, length: "length")).to have_attributes(length: "length")
    end
  end
end
