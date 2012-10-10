namespace :mp do

  def populate_place
    print "Macropolo: Populate Place table\n"

    print "  Place has " + Place.all.count.to_s + " item(s) before cleaning up...\n"
    Place.delete_all

    print "  Place has " + Place.all.count.to_s + " item(s) after cleaning up...\n"
    populate_place_USA
    #populate_place_category_CHN

    print "  Place has " + Place.all.count.to_s + " item(s) after population\n"

  end

  def populate_place_USA
    @pcs_USA = PlaceCategory.getCategories_by_country(PCC_COUNTRY_NAME_USA)
    @pcc_state =  @pcs_USA.find {|pc| pc[:name] == "state"}[:code]
    @pcc_county=  @pcs_USA.find {|pc| pc[:name] == "county"}[:code]
    @pcc_city =   @pcs_USA.find {|pc| pc[:name] == "city"}[:code]
    @pcc_town =   @pcs_USA.find {|pc| pc[:name]== "town"}[:code]

    Place.create!(:name=>"California",:place_category_code=>@pcc_state)


=begin
    Place.create!(:name=>"San Diego",@pcc_city)
    @pc_city.places << c1
    c1.save!

    s1 = Place.create(:name=>"California")
    @pc_state.places << s1
    s1.save!
=end


  end
=begin
  before(:each) do
    @pc_state = PlaceCategory.find_all_by_name("state")
    @pc_city = PlaceCategory.create!(:name=>"city", :desc=>"aaa", :country =>"USA", :level=>3 )
    @pc_spot = PlaceCategory.create!(:name=>"spot", :desc=>"ccc", :country => "USA", :level => 10 )
  end



  it "should be able to create with good with validated data" do
    a = Place.create(:name=>"San Diego")
    @pc_city.places << a
    a.save!

  class P_USA  < Hash
    def create(name, desc, level)
      self[:name]  = name
      self[:desc] =  desc
      self[:country] = "USA"
      self[:level] = level
      self
    end
  end

  def populate_place_categories_USA

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
=end

=begin

  class PC_CHN  < Hash
    def create(name, desc, level)
      self[:name]  = name
      self[:desc] =  desc
      self[:country] = "CHN"
      self[:level] = level
      self
    end
  end

  def populate_place_categories_CHN
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
=end



end