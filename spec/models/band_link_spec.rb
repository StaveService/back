require 'rails_helper'

RSpec.describe BandLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :band }
  end
end
