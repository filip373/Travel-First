# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    render locals: { places: Place.take_random(12) }
  end
end
