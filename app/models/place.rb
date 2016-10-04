class Place < ApplicationRecord
  has_many :slides, inverse_of: :place
  accepts_nested_attributes_for :slides

  validates :name, :teaser, presence: true
  mount_uploader :teaser, TeaserUploader
  after_save { teaser.resize_to_target }
  validates :teaser, min_width: 1920, min_height: 1080

  def self.take_random(count)
    raise 'Not enough places in database' if count > Place.count
    random(count)
  end

  private_class_method

  def self.random(count)
    places = []
    count.times do
      place = ''
      loop do
        place = Place.offset(rand(Place.count)).first
        break unless places.include?(place)
      end
      places.push(place)
    end
    places
  end
end
