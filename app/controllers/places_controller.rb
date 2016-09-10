class PlacesController < ApplicationController
  def show
    render locals: { place: Place.find(params[:id]) }
  end
end
