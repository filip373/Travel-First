require 'rails_helper'

describe Place, type: :model do
  after(:all) { CarrierWave.clean_cached_files!(0) }

  context 'when teaser is null' do
    subject { build_stubbed(:place, teaser: nil) }

    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when teaser is not null' do
    subject { build_stubbed(:place) }

    it 'is valid' do
      expect(subject).to be_valid
    end
    it 'teaser exists' do
      expect(subject.teaser).to be
    end
  end

  describe '.take_random' do
    context 'when there are enough places in database' do
      before { 5.times { create(:place) } }
      subject { Place.take_random(3) }

      it 'returns given number of places' do
        expect(subject.size).to eq(3)
      end
      it 'returns unique places' do
        expect(subject).to match_array(subject.uniq)
      end
    end

    context 'when there are not enough places in database' do
      it 'raises error' do
        expect { Place.take_random(3) }.to raise_error(/Not enough places/)
      end
    end
  end

  context 'when associated slides exist' do
    subject { create(:place_with_slides) }
    it 'returns valid slides count' do
      expect(subject.slides.count).to eq(3)
    end
  end
end
