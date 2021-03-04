require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject { build(:user) } 
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_length_of(:nickname).is_at_least(4).is_at_most(15) }
    it { should validate_length_of(:first_name).is_at_most(35) }
    it { should validate_length_of(:last_name).is_at_most(35) }
    it { should validate_uniqueness_of :nickname }
  end
end
