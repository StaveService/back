require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject { build(:user) } 
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_length_of(:nickname).is_at_least(4).is_at_most(30) }
    it { should validate_length_of(:first_name).is_at_most(35) }
    it { should validate_length_of(:last_name).is_at_most(35) }
    it { should validate_uniqueness_of :nickname }
  end

  context 'associations' do
    it { should have_one(:artist) }
    it { should have_many(:musics).dependent(:destroy) }
  end

  context "attributes" do
    it "has nickname" do
      expect(build(:user, nickname: "nickname")).to have_attributes(nickname: "nickname")
    end

    it "has first_name" do
      expect(build(:user, first_name: "first_name")).to have_attributes(first_name: "first_name")
    end

    it "has last_name" do
      expect(build(:user, last_name: "last_name")).to have_attributes(last_name: "last_name")
    end

    it "has introduction" do
      expect(build(:user, introduction: "introduction")).to have_attributes(introduction: "introduction")
    end

    it "has birthday" do
      date = DateTime.now
      expect(build(:user, birthday: date)).to have_attributes(birthday: date )
    end
  end
end
