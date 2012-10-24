class PlaceLandingController < ApplicationController
  def show
    @place = nil
    if (!params[:id].nil?)
      @place = Place.find(params[:id])
    end
  end
end
