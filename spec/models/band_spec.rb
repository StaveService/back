require 'rails_helper'

RSpec.describe Band, type: :model do
  context "validations" do
    it { should validate_presence_of :name }
  end

  context 'associations' do
    it { should have_many(:musics) }
    it { should have_many(:artists).through(:artist_bands) }
  end

  context "attributes" do
    it "has name" do
      expect(build(:band, name: "band")).to have_attributes(name: "band")
    end
  end
end
