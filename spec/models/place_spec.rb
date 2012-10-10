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

require 'spec_helper'
require File.expand_path("../../../lib/place_category",__FILE__)

describe Place do
  describe "basic validation" do
    before(:each) do
      pcs = PlaceCategory.getCategories_by_country(PCC_COUNTRY_NAME_USA)

      pc_state_city = pcs.find {|x| x[:name]=="city"}

      pc_state_city.should_not equal nil

      @pcc_city_in_USA = pc_state_city[:code]

      @pcc_wrong = 0
      PlaceCategory.getValidatePlaceCategoryCodes.find {|code| code== @pcc_wrong}.should be nil

    end



    it "should be able to create with good with validated data: name and pcc code" do
      a = Place.create!(:name=>"San Diego", :place_category_code=>@pcc_city_in_USA)

      ax = Place.find_by_id(a.id)
      ax.id.should be a.id
    end

    it "should be not create with wrong pcc code" do
      lambda do
        Place.create!(:name=>"San Diego", :place_category_code => @pcc_wrong)
      end.should raise_error
    end



    it "should raise error when to create invalid item" do
      lambda do
        Place.create!()
      end.should raise_error

      lambda do
        a = Place.create!(:name=>"San Diego")
      end.should raise_error

      lambda do
        a = Place.create!(:alt_name1 =>"San Diego,CA")
      end.should raise_error
    end


  end
end

