# == Schema Information
#
# Table name: search_places
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SearchPlace < ActiveRecord::Base
  belongs_to :place
  attr_accessible :name
  validates_associated :place
end
