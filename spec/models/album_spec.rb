require 'rails_helper'

RSpec.describe Album, type: :model do

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_most(100) }
  end

  context 'associations' do
    it { should have_many :musics }
  end

  context "attributes" do
    it "has title" do
      expect(build(:album, title: "title")).to have_attributes(title: "title")
    end

    it "has release_date" do
      date = Date.today
      expect(build(:album, release_date: date)).to have_attributes(release_date: date)
    end
  end
end
