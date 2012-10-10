require 'singleton'

PCI_COUNTRY_NAME_USA = "USA"
PCI_COUNTRY_NAME_CHN = "CHN"

print "load me"

module PlaceCategoryX



  def self.getCategories
    PlaceCategoryArray.instance
  end

  def self.getCategories_by_country(name)
    PlaceCategoryArray.instance.find {|x| x[:country]==name}
  end


  def self.getCountries
    PlaceCategoryCountryMap.instance
  end

  PCI_BASE_USA = 100
  PCI_BASE_CHN = 200
  PCI_OFF_SPOT = 99

  class PlaceCategoryCountryMap < Hash
    include Singleton

    def initialize
      print "PlaceCategoryCountryMap initialize..\n"
      init_map
    end

    private
    def init_map
      print "init_map\n"
      self[PCI_COUNTRY_NAME_USA] = "United State"
      self[PCI_COUNTRY_NAME_CHN] = "People's Republic of China"
    end
  end


  class PlaceCategoryItem < Hash
    def initialize(country,  id, level, name, desc)
      self[:country] = country
      self[:id] = id
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
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_USA, PCI_BASE_USA+1, 1, "state",  "desc state")
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_USA, PCI_BASE_USA+2, 2, "county", "desc county")
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_USA, PCI_BASE_USA+3, 3, "city",   "desc city")
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_USA, PCI_BASE_USA+4, 3, "town",   "desc city")


    end

    private
    def init_CHN
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_CHN, PCI_BASE_CHN+1, 1, "province",     "desc province")
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_CHN, PCI_BASE_CHN+2, 2, "municipality", "desc municipality")
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_CHN, PCI_BASE_CHN+3, 3, "city",         "desc city")
      self <<  PlaceCategoryItem.new(PCI_COUNTRY_NAME_CHN, PCI_BASE_CHN+4, 3, "county",       "desc county")

    end
  end
end