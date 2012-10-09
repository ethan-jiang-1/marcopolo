class PlaceCategory < ActiveRecord::Base
  attr_accessible :desc, :is_area, :is_spot, :name, :geo_level
end
