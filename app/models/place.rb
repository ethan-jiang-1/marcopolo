# == Schema Information
#
# Table name: places
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  alt_name1         :string(255)
#  alt_name2         :string(255)
#  alt_name3         :string(255)
#  latitude          :float
#  longitude         :float
#  place_category_id :integer
#  is_inactive       :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Place < ActiveRecord::Base
  belongs_to :place_category
  attr_accessible :alt_name1, :alt_name2, :alt_name3, :is_inactive, :latitude, :longitude, :name
  validates_presence_of :name
  validates_associated :place_category                #rails actually seems do not do any validation here - follow up to check
  validates_presence_of :place_category_id
end
