require 'rails_helper'

RSpec.describe Slide, type: :model do
  context 'when title is empty' do
    subject { build_stubbed(:slide, title: '') }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when description is empty' do
    subject { build_stubbed(:slide, description: '') }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when photo is null' do
    subject { build_stubbed(:slide, photo: nil) }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when title, description and photo not empty' do
    subject { build_stubbed(:slide) }
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
