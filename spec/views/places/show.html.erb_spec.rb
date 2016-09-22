require 'rails_helper'

describe 'places/show.html.erb', type: :view do
  let(:place) { create(:place_with_slides) }
  before do
    render template: 'places/show', locals: { place: place }
  end

  it 'has place name' do
    expect(rendered).to have_css('.place-title', text: 'Some test place')
  end
  it 'has teaser photo' do
    expect(rendered).to have_css("img[src=\"#{place.teaser}\"]")
  end
  it 'has 3 slides photos' do
    expect(rendered).to have_css("img[src=\"#{place.slides[0].photo}\"]")
    expect(rendered).to have_css("img[src=\"#{place.slides[1].photo}\"]")
    expect(rendered).to have_css("img[src=\"#{place.slides[2].photo}\"]")
  end
end
