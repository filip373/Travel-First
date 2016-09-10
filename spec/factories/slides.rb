FactoryGirl.define do
  factory :slide do
    place
    title 'Some test slide'
    description 'Some test description'
    photo do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'photo.jpg')
      )
    end
  end
end
