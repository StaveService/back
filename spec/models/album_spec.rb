require 'rails_helper'

RSpec.describe Album, type: :model do

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(100) }
  end

   context 'associations' do
    it { should belong_to(:artist) }
  end
end
