# encoding: utf-8
#
class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def resize_to_target
    resize_to_fill(1366, 853)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
