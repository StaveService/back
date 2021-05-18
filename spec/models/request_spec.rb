require 'rails_helper'

RSpec.describe Request, type: :model do
  context "validations" do
    it { should validate_presence_of :title }
  end
  context 'associations' do
    it { should belong_to :user }
  end
end
