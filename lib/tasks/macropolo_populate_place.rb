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

    Place.create!(:name=>"California",:alt_name1=>"CA", :alt_name2=>"Sunny state",:place_category_code=>@pcc_state)

    Place.create!(:name=>"San Deigo",:alt_name1=>"SanDiego", :alt_name2=> "San Diego, CA",:place_category_code=>@pcc_city)

    #Place.create!(:name=>"San Deigo",:alt_name1=>"SanDiego", :place_category_code=>@pcc_county)

  end
end