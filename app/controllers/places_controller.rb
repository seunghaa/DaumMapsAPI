class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
  end
end
