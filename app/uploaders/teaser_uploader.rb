# encoding: utf-8

class TeaserUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fill: [450, 300]
  end

  def resize_to_target
    resize_to_fill(1920, 1080)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
