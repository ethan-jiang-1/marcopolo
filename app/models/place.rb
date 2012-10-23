# == Schema Information
#
# Table name: places
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :string(255)
#  unified_address :string(255)
#  latitude        :float
#  longitude       :float
#  categories      :string(255)
#  is_inactive     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Place < ActiveRecord::Base
  attr_accessible :address, :unified_address, :is_inactive, :latitude, :longitude, :name, :categories
  validates_presence_of   :name
  validates_presence_of   :address
  validates_presence_of   :unified_address
  validates_uniqueness_of :unified_address

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end


