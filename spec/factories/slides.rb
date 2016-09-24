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
  end
end
