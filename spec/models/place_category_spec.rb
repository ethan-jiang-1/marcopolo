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

require 'spec_helper'

describe PlaceCategory do
  describe "basic validation" do
    it "should be able to create with good with validated data" do
      a = PlaceCategory.create!(:name=>"city", :desc=>"aaa", :country =>"USA", :level=>3 )
      b = PlaceCategory.create!(:name=>"state", :desc=>"bbb", :country => "USA", :level => 2 )

      PlaceCategory.find_by_id(a.id).id.should be a.id
      PlaceCategory.find_by_id(b.id).id.should be b.id
      a.id.should_not be b.id
    end

    it "should raise error when to create invalid item" do
      lambda do
        PlaceCategory.create!()
      end.should raise_error

      lambda do
        PlaceCategory.create!(:name=>"a")
      end.should raise_error

      lambda do
        PlaceCategory.create!(:desc=>"aaa")
      end.should raise_error

      lambda do
        PlaceCategory.create!(:country=>true)
      end.should raise_error

      lambda do
        PlaceCategory.create!(:level => 3 )
      end.should raise_error

    end

    it "should be failed if two same category in the same country" do
      lambda do
        a = PlaceCategory.create!(:name=>"city", :desc=>"aaa", :country =>"USA", :level=>3 )
        b = PlaceCategory.create!(:name=>"city", :desc=>"bbb", :country => "USA", :level => 2 )
      end.should raise_error
    end

    it "should be ok if two same category in the different country" do
      a = PlaceCategory.create!(:name=>"city", :desc=>"aaa", :country =>"USA", :level=>3 )
      b = PlaceCategory.create!(:name=>"city", :desc=>"bbb", :country => "CHN", :level => 2 )

      PlaceCategory.find_by_id(a.id).id.should be a.id
      PlaceCategory.find_by_id(b.id).id.should be b.id
      a.id.should_not be b.id
    end


  end
end
