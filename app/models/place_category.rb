class PlaceCategory < ActiveRecord::Base
  attr_accessible :desc, :is_spot, :name
  validates_presence_of :name, :desc
  validates_inclusion_of :is_spot, :in => [true, false]
  validates_uniqueness_of :name
end
