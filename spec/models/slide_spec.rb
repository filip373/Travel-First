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

  context 'with valid factory' do
    subject { build_stubbed(:slide) }
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when title is too long' do
    subject do
      build_stubbed(
        :slide,
        title: '234 532 2 34 er df v xd fs f sgsfsfgadf dsafagsdfsadgf'
      )
    end
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when description is too long' do
    subject do
      build_stubbed(
        :slide,
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'\
        'Morbi volutpat fringilla eros, ac ullamcorper arcu'\
        ' ullamcorper id. Aenean efficitur diam vitae suscipit'\
        ' pellentesque. Pellentesque iaculis sapien sit amet velit'\
        ' sollicitudin, eu feugiat nisi aliquet. Aliquam id auctor'\
        ' risus. Phasellus scelerisque sagittis purus, sagittis'\
        ' imperdiet felis hendrerit non. Ut ipsum leo, efficitur eu'\
        ' molestie eu, interdum vel libero. Donec enim felis, tristique'\
        ' vel tempus vitae, tempor ac enim. Morbi finibus sit amet metus'\
        ' at dictum. Duis vestibulum libero vitae arcu ultricies vehicula.'\
        ' Ut ipsum leo, efficitur eu molestie eu, interdum vel libero.'\
        ' Donec enim felis, tristique vel tempus vitae, tempor ac enim.'
      )
    end
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when description is too short' do
    subject { build_stubbed(:slide, description: 'too short') }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end
end
