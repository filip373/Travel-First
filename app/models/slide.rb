class Slide < ApplicationRecord
  belongs_to :place

  mount_uploader :photo, PhotoUploader
  validates :title, :photo, :description, presence: true
  validates :title, length: { maximum: 40 }
  validates :description, length: { minimum: 100, maximum: 650 }
end
