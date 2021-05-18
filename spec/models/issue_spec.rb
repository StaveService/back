require 'rails_helper'

RSpec.describe Issue, type: :model do
  context 'associations' do
    it { should belong_to :user }
    it { should belong_to :music }
  end
end
