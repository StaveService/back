require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :nickname }
    it { should validate_uniqueness_of :nickname }
    subject { build(:user) } 
    it { should validate_length_of(:nickname).is_at_least(1).is_at_most(15) }
  end
end
