require 'rails_helper'

RSpec.describe Artist, type: :model do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(50) }
  end
  
  context 'associations' do
    it { should have_many :artist_musics }
    it { should have_many :artist_albums }
    it { should have_many :artist_bands }
    it { should have_many :artist_bookmarks }
    it { should have_many(:musics).through(:artist_musics) }
    it { should have_many(:albums).through(:artist_albums) }
    it { should have_many(:bands).through(:artist_bands) }
    it { should have_many(:bookmarks).through(:artist_bookmarks).source(:artist).dependent(:destroy) }
  end
  
  context "attributes" do
    it "has name" do
      expect(build(:artist, name: "artist")).to have_attributes(name: "artist")
    end
  end
end
