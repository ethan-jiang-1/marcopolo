# == Schema Information
#
# Table name: places
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  alt_name1           :string(255)
#  alt_name2           :string(255)
#  alt_name3           :string(255)
#  latitude            :float
#  longitude           :float
#  place_category_code :integer
#  is_inactive         :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Place < ActiveRecord::Base
  attr_accessible :alt_name1, :alt_name2, :alt_name3, :is_inactive, :latitude, :longitude, :name, :place_category_code
  validates_presence_of :name
  validates_presence_of :place_category_code
  validates_inclusion_of :place_category_code, :in => PlaceCategory.getValidatePlaceCategoryCodes
end


