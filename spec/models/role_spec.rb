require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'associations' do
    it{ should belong_to :artist }
    it{ should belong_to :music}
    it{ should define_enum_for(:role).with_values(vocal: 0, guitar: 1, base: 2, drum: 3) }
  end

  context "attributes" do
    it "has name" do
      expect(build(:role, role: 1)).to have_attributes(role: "guitar")
    end
  end
end
