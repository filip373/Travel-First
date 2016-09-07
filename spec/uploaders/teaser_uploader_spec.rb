require 'rails_helper'
require 'carrierwave/test/matchers'

describe TeaserUploader do
  let(:place) { instance_double('Place', id: 1) }
  let(:subject) { TeaserUploader.new(place) }

  before do
    File.open(File.join(Rails.root, 'spec', 'support', 'photo.jpg')) do |file|
      subject.store!(file)
    end
  end

  after do
    subject.remove!
  end

  after(:all) do
    CarrierWave.clean_cached_files!(0)
  end

  it 'has correct dimensions' do
    expect(subject).to have_dimensions(900, 630)
  end
  it 'has correct format' do
    expect(subject).to be_format('jpeg')
  end
end
