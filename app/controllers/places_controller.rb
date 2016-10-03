class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    place = Place.new
    3.times { place.slides.build }
    render locals: { place: place }
  end

  def create
    place = Place.new(place_params)
    if place.valid? && place.slides.length < 3
      flash.now[:error] = 'You need to upload at least 3 slides'
      render action: :new, locals: { place: place }
    elsif place.save
      redirect_to place
    else
      render action: :new, locals: { place: place }
    end
  end

  def show
    render locals: { place: Place.find(params[:id]) }
  end

  private

  def place_params
    params.require(:place).permit(
      :name, :teaser, slides_attributes: [:title, :photo, :description]
    )
  end
end
