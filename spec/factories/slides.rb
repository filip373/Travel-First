FactoryGirl.define do
  factory :slide do
    place
    title 'Some test slide'
    description 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'\
                ' Morbi volutpat fringilla eros, ac ullamcorper arcu'
    photo do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'photo.jpg')
      )
    end

    factory :slide_with_photo_below_width do
      photo do
        Rack::Test::UploadedFile.new(
          File.join(Rails.root, 'spec', 'support', 'photo_big_bel_width.jpg')
        )
      end
    end

    factory :slide_with_photo_below_height do
      photo do
        Rack::Test::UploadedFile.new(
          File.join(Rails.root, 'spec', 'support', 'photo_big_bel_height.jpg')
        )
      end
    end
  end
end
