class Slide < ApplicationRecord
  belongs_to :place, inverse_of: :slides

  mount_uploader :photo, PhotoUploader
  validates :title, :photo, :description, presence: true
  validates :title, length: { maximum: 40 }
  validates :description, length: { minimum: 100, maximum: 650 }
  validates :place, presence: true

  after_save { photo.resize_to_target }
  validates :photo, min_width: 1366, min_height: 853
end
