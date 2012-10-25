class HomeController < ApplicationController
  def index

  end

  def newplace_by_geocoder
    if (params[:search])
      lookup_newplace_by_geocoder(params[:search])
    end
  end

  def newplace_by_googleplace
    if (params[:search])
      lookup_newplace_by_googleplace(params[:search])
    end
  end

  def newplace_by_coordinate
    if (params[:search])
      lookup_newplace_by_coordinate(params[:search])
    end
  end

  def searchplace
    @search = params[:search]
    @places = Place.where("unified_address LIKE ?", "%#{params[:search]}%")
  end

  private
  def lookup_newplace_by_geocoder(query)
    @geo_search = query
    @geo_results = Geocoder.search(query)

#    @geo_results.each do |r|
#      p r
#    end
  end

  def lookup_newplace_by_googleplace(query)
    @gpl_search = query
    @gpl_client = GooglePlaces::Client.new("AIzaSyCEnnMUAvlq0DeYsQ-vWcVqUNi8_qM2ol8")
    @gpl_results = @gpl_client.spots_by_query(query)

#    @gpl_results.each do |r|
#      p r
#    end
  end

  def lookup_newplace_by_coordinate(query)
    @cdt_search = query

    lat = 0.0
    lng = 0.0
    sn = query.split(",")
    if sn.count >= 2
      lat = sn[0].to_f
      lng = sn[1].to_f
    end

    if (lat != 0.0 && lng != 0.0 )

      @cdt_gpl_client = GooglePlaces::Client.new("AIzaSyCEnnMUAvlq0DeYsQ-vWcVqUNi8_qM2ol8")
      @cdt_gpl_results = @cdt_gpl_client.spots(lat,lng)

      @cdt_geo_results = Geocoder.search(query)
    end
  end

end
