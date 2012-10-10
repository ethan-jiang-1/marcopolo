require 'spec_helper'
require File.expand_path("../../../lib/place_category",__FILE__)


describe  PlaceCategory do

  describe "GET 'index'" do
    it "test" do
      #yizhen - how to get the Place_category instance (singleton)
      pca = PlaceCategory.getCategories
      #p pca

      pcm = PlaceCategory.getCountries
      #p pcm

      pca_usa = PlaceCategory.getCategories_by_country(PCC_COUNTRY_NAME_USA)
      #p pca_usa

      pca_chn = PlaceCategory.getCategories_by_country(PCC_COUNTRY_NAME_CHN)
      #p pca_chn

      pccs = PlaceCategory.getValidatePlaceCategoryCodes()
      #p pccs

      pending "yizhen: do some test here for PlaceCategory  #{__FILE__}"
    end
  end

end


