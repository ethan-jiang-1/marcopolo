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

require 'spec_helper'

describe Place do
  describe "basic validation" do
    before(:each) do
      @pc_state = PlaceCategory.create!(:name=>"state", :desc=>"bbb", :country => "USA", :level => 2 )
      @pc_city = PlaceCategory.create!(:name=>"city", :desc=>"aaa", :country =>"USA", :level=>3 )
      @pc_spot = PlaceCategory.create!(:name=>"spot", :desc=>"ccc", :country => "USA", :level => 10 )
    end



    it "should be able to create with good with validated data" do
      a = Place.create(:name=>"San Diego")
      @pc_city.places << a
      a.save!

      ax = Place.find_by_id(a.id)
      ax.id.should be a.id
      ax.place_category_id.should be @pc_city.id
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

