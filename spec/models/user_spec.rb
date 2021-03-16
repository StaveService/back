require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject { build(:user) } 
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :familyname }
    it { should validate_presence_of :givenname }
    it { should validate_length_of(:nickname).is_at_least(4).is_at_most(30) }
    it { should validate_length_of(:familyname).is_at_most(35) }
    it { should validate_length_of(:givenname).is_at_most(35) }
    it { should validate_uniqueness_of :nickname }
  end

  context 'associations' do
    it { should have_many :musics }
    it { should have_many :requests }
    it { should have_many :issues }
  end

  context "attributes" do
    it "has nickname" do
      expect(build(:user, nickname: "nickname")).to have_attributes(nickname: "nickname")
    end

    it "has family_name" do
      expect(build(:user, familyname: "familyname")).to have_attributes(familyname: "familyname")
    end

    it "has give_name" do
      expect(build(:user, givenname: "givenname")).to have_attributes(givenname: "givenname")
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
