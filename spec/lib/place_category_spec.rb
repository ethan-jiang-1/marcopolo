require 'spec_helper'
require File.expand_path("../../../lib/place_category",__FILE__)
require File.expand_path("../../../lib/place_category",__FILE__)
require File.expand_path("../../../lib/place_category",__FILE__)

describe  PlaceCategoryX do

  describe "GET 'index'" do
    it "test" do
      #yizhen - how to get the Place_category instance (singleton)
      pca = PlaceCategoryX.getCategories
      p pca

      pcm = PlaceCategoryX.getCountries
      p pcm

      pca_USA = PlaceCategoryX.getCategories_by_country(PCI_COUNTRY_NAME_USA)
      p pca_USA

      pca_CHN = PlaceCategoryX.getCategories_by_country(PCI_COUNTRY_NAME_CHN)
      p pca_CHN

    end
  end

end


