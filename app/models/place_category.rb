# == Schema Information
#
# Table name: place_categories
#
#  id      :integer          not null, primary key
#  name    :string(255)
#  desc    :string(255)
#  country :string(255)
#  level   :integer
#

class PlaceCategory < ActiveRecord::Base
  has_many :places
  attr_accessible :desc, :name, :country, :level
  validates_presence_of :name, :desc, :country, :level
  validates_inclusion_of :level, :in => 1..10
  validates_uniqueness_of :name, :scope => [:country]
end
