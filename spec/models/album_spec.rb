require 'rails_helper'

RSpec.describe Album, type: :model do

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_most(100) }
  end

  context 'associations' do
    it { should have_one :album_link }
    it { should have_many :musics }
    it { should have_many :album_musics }
    it { should have_many :band_albums }
    it { should have_many :artist_albums }
    it { should have_many(:musics).through(:album_musics) }
    it { should have_many(:artists).through(:artist_albums) }
    it { should have_many(:bands).through(:band_albums) }
  end

  context "attributes" do
    it "has title" do
      expect(build(:album, title: "title")).to have_attributes(title: "title")
    end
  end
end
