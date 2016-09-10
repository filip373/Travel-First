require 'rails_helper'
require 'carrierwave/test/matchers'

describe PhotoUploader do
  let(:photo) { instance_double('Photo', id: 1) }
  let(:subject) { PhotoUploader.new(photo) }

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
    expect(subject).to have_dimensions(1366, 853)
  end
  it 'has correct format' do
    expect(subject).to be_format('jpeg')
  end
end
