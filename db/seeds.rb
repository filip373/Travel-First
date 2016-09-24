data = JSON.parse(File.read('db/seeds/places.json'))
data.each do |record|
  place = Place.create(
    name: record['name'], remote_teaser_url: record['remote_teaser_url']
  )
  record['slides'].each do |slide|
    place.slides.new.from_json(slide.to_json).save!
  end
end
