# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  alt_name1   :string(255)
#  alt_name2   :string(255)
#  alt_name3   :string(255)
#  latitude    :float
#  longitude   :float
#  categories  :string(255)
#  is_inactive :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Place < ActiveRecord::Base
  attr_accessible :alt_name1, :alt_name2, :alt_name3, :address, :is_inactive, :latitude, :longitude, :name, :categories
  validates_presence_of :name
  validates_presence_of :address

  #validates_presence_of :place_category_code
  #validates_inclusion_of :place_category_code, :in => PlaceCategory.getValidatePlaceCategoryCodes

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end


