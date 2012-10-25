module PlacesHelper

  def gmap_image_tag (lat, lng, types = nil)
    size="600x400"
    zoom = 4

    if !types.nil?
        pt = types[0].to_s
        zoom = case pt
          when "country"
            3
          when "administrative_area_level_1"
            6
          when "locality"
            6
          when "sublocality"
            12
          when "route", "neighborhood"
            14
          when "street_number", "street_address", "establishment", "point_of_interest"
            16
          else
            print "\n**** unknown type for determing zoom:" + pt
            8
        end
    end


    tag = "<img src=\"http://maps.google.com/maps/api/staticmap?size=#{size}&sensor=false&zoom=#{zoom}&markers=#{lat}%2C#{lng}\">".html_safe
  end

end
