class HomeController < ApplicationController
  def index

  end

  def newplace
    if (params[:search])
      lookup_newplace(params[:search])
    end
  end

  def searchplace
    @search = params[:search]
    @places = Place.where("unified_address LIKE ?", "%#{params[:search]}%")
  end

  private
  def lookup_newplace(query)
    @geo_search = query
    @geo_results = Geocoder.search(query)
  end

end
