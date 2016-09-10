class Slide < ApplicationRecord
  belongs_to :place

  mount_uploader :photo, PhotoUploader
  validates :title, :photo, :description, presence: true
end
