FactoryGirl.define do
  factory :place do
    name 'Some test place'
    teaser do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'photo.jpg')
      )
    end
    factory :place_with_slides do
      transient do
        slides_count 3
      end
      after(:create) do |place, evaluator|
        create_list(:slide, evaluator.slides_count, place: place)
      end
    end
  end
end
