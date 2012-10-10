require 'singleton'

PCC_COUNTRY_NAME_USA = "USA"
PCC_COUNTRY_NAME_CHN = "CHN"

module PlaceCategory

  def self.getCategories
    PlaceCategoryArray.instance
  end

  def self.getCountries
    PlaceCategoryCountryMap.instance
  end

  def self.getCategories_by_country(name)
    PlaceCategoryArray.instance.select {|x| x[:country]==name}
  end

  def self.getValidatePlaceCategoryCodes()
    codes = Array.new
    PlaceCategoryArray.instance.each {|x| codes << x[:code]}
    codes
  end



  #PlaceCategoryCode
  PCC_BASE_USA = 100
  PCC_BASE_CHN = 200
  PCC_OFF_SPOT = 90

  class PlaceCategoryCountryMap < Hash
    include Singleton

    def initialize
      print "PlaceCategoryCountryMap initialize..\n"
      init_map
    end

    private
    def init_map
      self[PCC_COUNTRY_NAME_USA] = "United State"
      self[PCC_COUNTRY_NAME_CHN] = "People's Republic of China"
    end
  end


  class PlaceCategoryItem < Hash
    def initialize(country,  code, level, name, desc)
      self[:country] = country
      self[:code] = code
      self[:level] = level
      self[:name] = name
      self[:desc] = desc
    end
  end



  class PlaceCategoryArray < Array
    include Singleton

    def initialize
      print "PlaceCategoryArray initialize..\n"
      init_USA
      init_CHN
    end

    private
    def init_USA
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_USA+1, 1, "state",  "desc state")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_USA+2, 2, "county", "desc county")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_USA+3, 3, "city",   "desc city")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_USA+4, 3, "town",   "desc town")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_USA+5, 3, "area",   "desc area")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_USA + PCC_OFF_SPOT, 20, "spot",   "desc spot")

    end

    private
    def init_CHN
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_CHN, PCC_BASE_CHN+1, 1, "province",     "desc province")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_CHN, PCC_BASE_CHN+2, 2, "municipality", "desc municipality")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_CHN, PCC_BASE_CHN+3, 3, "city",         "desc city")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_CHN, PCC_BASE_CHN+4, 3, "county",       "desc county")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_CHN, PCC_BASE_CHN+5, 3, "district",     "desc district")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_CHN+6, 3, "area",         "desc area")
      self <<  PlaceCategoryItem.new(PCC_COUNTRY_NAME_USA, PCC_BASE_CHN + PCC_OFF_SPOT, 20, "spot",   "desc spot")
    end
  end
end