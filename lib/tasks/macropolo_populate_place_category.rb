namespace :mp do

  def populate_place_category
    print "Macropolo: Populate PlaceCategory table\n"

    print "  PlaceCategory has " + PlaceCategory.all.count.to_s + " item(s) before cleaning up...\n"
    PlaceCategory.destroy_all

    print "  PlaceCategory has " + PlaceCategory.all.count.to_s + " item(s) after cleaning up...\n"
    populate_place_category_USA
    populate_place_category_CHN

    print "  PlaceCategory has " + PlaceCategory.all.count.to_s + " item(s) after population\n"

  end

  class PC_USA  < Hash
    def create(name, desc, level)
      self[:name]  = name
      self[:desc] =  desc
      self[:country] = "USA"
      self[:level] = level
      self
    end
  end

  def populate_place_category_USA

    places = Array.new
    places << PC_USA.new.create("state", "the state", 1)
    places << PC_USA.new.create("county", "the county", 2)
    places << PC_USA.new.create("city", "the city", 3)
    places << PC_USA.new.create("town", "the town",3)
    places << PC_USA.new.create("sight", "the sight",4)
    places << PC_USA.new.create("building", "the building",4)
    places << PC_USA.new.create("spot", "the spot",10)


    places.each do |pl|
      name = pl[:name]
      desc = pl[:desc]
      country =  pl[:country]
      level =  pl[:level]
      PlaceCategory.create!(:name => name, :desc => desc, :country => country, :level=> level )
    end
  end

  class PC_CHN  < Hash
    def create(name, desc, level)
      self[:name]  = name
      self[:desc] =  desc
      self[:country] = "CHN"
      self[:level] = level
      self
    end
  end

  def populate_place_category_CHN
    places = Array.new
    places << PC_CHN.new.create("province", "the state", 1)
    places << PC_CHN.new.create("Municipality", "the Municipality", 1)
    places << PC_CHN.new.create("county", "the county", 2)
    places << PC_CHN.new.create("city", "the city", 2)
    places << PC_CHN.new.create("town", "the town",3)
    places << PC_CHN.new.create("district", "the district",4)
    places << PC_CHN.new.create("sight", "the sight",5)
    places << PC_CHN.new.create("building", "the building",5)
    places << PC_CHN.new.create("spot", "the spot",10)


    places.each do |pl|
      name = pl[:name]
      desc = pl[:desc]
      country =  pl[:country]
      level =  pl[:level]
      PlaceCategory.create!(:name => name, :desc => desc, :country => country, :level=> level )
    end
  end



end