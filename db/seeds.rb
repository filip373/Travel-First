1.upto(17) do |i|
  Place.create(
    name: "Test #{i}",
    teaser: File.open(File.join(Rails.root, 'db', 'seed_images', "#{i}.jpg"))
  )
end
