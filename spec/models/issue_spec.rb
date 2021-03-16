require 'rails_helper'

RSpec.describe Issue, type: :model do
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  context 'associations' do
    it { should belong_to :user }
    it { should belong_to :music }
  end
end
