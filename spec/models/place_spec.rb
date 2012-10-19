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


require 'spec_helper'

describe Place do
  describe "basic validation" do
    before(:each) do
    end



    it "should be able to create with good with validated data: name and address" do
      a = Place.create!(:name=>"San Diego", :address=>"San Deigo, CA")

      ax = Place.find_by_id(a.id)
      ax.id.should be a.id
    end

    it "should raise error when to create invalid item" do
      lambda do
        Place.create!()
      end.should raise_error

      lambda do
        a = Place.create!(:name=>"San Diego")
      end.should raise_error

      lambda do
        a = Place.create!(:address =>"San Diego, CA")
      end.should raise_error

      lambda do
        a = Place.create!(:alt_name1 =>"San Diego city")
      end.should raise_error
    end


  end
end

