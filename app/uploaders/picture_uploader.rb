# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :regular do
    process resize_to_fit: [400, 500]
  end

  def extension_white_list
    %w(jpg jpeg)
  end

  def filename
    "picture.jpg"
  end
end
