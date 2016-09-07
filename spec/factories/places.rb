FactoryGirl.define do
  factory :place do
    name 'Some test place'
    teaser do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'photo.jpg')
      )
    end
  end
end
