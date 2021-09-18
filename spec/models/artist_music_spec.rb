require 'rails_helper'

RSpec.describe ArtistMusic, type: :model do
  let(:roles) { described_class.roles }

  context 'when associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :music }
  end

  context 'when attributes' do
    it 'has artist_id' do
      expect(build(:artist_music, artist_id: 1)).to have_attributes(artist_id: 1)
    end

    it 'has music_id' do
      expect(build(:artist_music, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has role vocal' do
      expect(build(:artist_music, role: roles[:vocal])).to have_attributes(role: roles.key(roles[:vocal]))
    end

    it 'has role guitar' do
      expect(build(:artist_music, role: roles[:guitar])).to have_attributes(role: roles.key(roles[:guitar]))
    end

    it 'has role base' do
      expect(build(:artist_music, role: roles[:base])).to have_attributes(role: roles.key(roles[:base]))
    end

    it 'has role drum' do
      expect(build(:artist_music, role: roles[:drum])).to have_attributes(role: roles.key(roles[:drum]))
    end

    it 'has role vocal_guitar' do
      expect(build(:artist_music, role: roles[:vocal_guitar])).to have_attributes(role: roles.key(roles[:vocal_guitar]))
    end

    it 'has role vocal_base' do
      expect(build(:artist_music, role: roles[:vocal_base])).to have_attributes(role: roles.key(roles[:vocal_base]))
    end
  end
end
