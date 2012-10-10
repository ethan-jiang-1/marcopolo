require 'spec_helper'
require File.expand_path("../../../lib/place_category",__FILE__)


describe  PlaceCategory do

  describe "constants" do
    it "should have all items prepared" do
      #yizhen - how to get the Place_category instance (singleton)
      pca = PlaceCategory.getCategories
      pca.count.should_not be 0

      pcm = PlaceCategory.getCountries
      pcm.count.should_not be 0

      pca_usa = PlaceCategory.getCategories_by_country(PCC_COUNTRY_NAME_USA)
      pca_usa.count.should_not be 0

      pca_chn = PlaceCategory.getCategories_by_country(PCC_COUNTRY_NAME_CHN)
      pca_chn.count.should_not be 0

      pccs = PlaceCategory.getValidatePlaceCategoryCodes()
      pccs.count.should_not be 0

    end
  end

end


