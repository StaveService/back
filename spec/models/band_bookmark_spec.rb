require 'rails_helper'

RSpec.describe BandBookmark, type: :model do
  context 'associations' do
    it { should belong_to :band }
    it { should belong_to :user }
  end
end
