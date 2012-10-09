require 'spec_helper'

describe PlaceCategory do
  describe "basic validation" do
    it "should be able to create with good with validated data" do
      a = PlaceCategory.create!(:name=>"a", :desc=>"aaa", :is_spot=>false )
      b = PlaceCategory.create!(:name=>"b", :desc=>"bbb", :is_spot=>true )

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
        PlaceCategory.create!(:is_spot=>true)
      end.should raise_error
    end
  end
end
