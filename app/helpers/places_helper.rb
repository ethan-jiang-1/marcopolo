module PlacesHelper


  def gmap_static_image_tag (lat, lng, types = nil)
    size="450x300"
    zoom = 4

    if @hash_type_to_zoom.nil?
      @hash_type_to_zoom = Hash.new
    end

    if @hash_type_to_zoom.empty?
      @hash_type_to_zoom["country"]                     = 3             #country
      @hash_type_to_zoom["administrative_area_level_1"] = 4             #state
      @hash_type_to_zoom["administrative_area_level_2"] = 5             #city
      @hash_type_to_zoom["locality"]                    = 8
      @hash_type_to_zoom["sublocality"]                 = 11
      @hash_type_to_zoom["route"]                       = 12
      @hash_type_to_zoom["establishment"]               = 12
      @hash_type_to_zoom["street_address"]              = 14
    end

    find = false
    if !types.nil?
        types.each do |tt|
          pl_type = tt.to_s
          if @hash_type_to_zoom.has_key?(pl_type)
              zoom = @hash_type_to_zoom[pl_type]
              find = true
              break
            end
        end
    end

#    if !find
#      p types
#    end


    # image_tag "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=4&markers=#{r.lat}%2C#{r.lng}"
    tag = "<img src=\"http://maps.google.com/maps/api/staticmap?size=#{size}&sensor=false&zoom=#{zoom}&markers=#{lat}%2C#{lng}\">".html_safe
  end

end
