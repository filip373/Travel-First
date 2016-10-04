require 'rails_helper'

class Validatable
  include ActiveModel::Validations
  attr_accessor :image
  validates :image, min_width: 150
end

RSpec.describe MinWidthValidator do
  subject { Validatable.new }
  before { subject.image = image }

  context 'when image is null' do
    let(:image) { nil }

    it 'makes record invalid' do
      expect(subject).to be_invalid
    end

    it 'adds errors message to record' do
      subject.validate
      expect(subject.errors.messages[:image])
        .to include('must exist')
    end
  end

  context 'when image is blank' do
    let(:image) { CarrierWave::Uploader::Base.new }

    it 'makes record invalid' do
      expect(subject).to be_invalid
    end

    it 'adds errors message to record' do
      subject.validate
      expect(subject.errors.messages[:image])
        .to include('must exist')
    end
  end

  context 'when width is below min width' do
    let(:image) do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'teaser_bel_width.jpg')
      )
    end

    it 'makes record invalid' do
      expect(subject).to be_invalid
    end

    it 'adds error message to record' do
      subject.validate
      expect(subject.errors.messages[:image])
        .to include('width is below minimum')
    end
  end

  context 'when width is above min width' do
    let(:image) do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'photo.jpg')
      )
    end

    it 'does not make record invalid' do
      expect(subject).to be_valid
    end
  end

  context 'when width is equal min width' do
    let(:image) do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'photo_150w.jpg')
      )
    end

    it 'does not make record invalid' do
      expect(subject).to be_valid
    end
  end
end
