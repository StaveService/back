require 'rails_helper'

RSpec.describe Artist, type: :model do
  
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(100) }
  end
  
  context 'associations' do
    it { should have_many(:albums).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  context "attributes" do
    it "has name" do
      expect(build(:artist, name: "artist")).to have_attributes(name: "artist")
    end
  end
end
