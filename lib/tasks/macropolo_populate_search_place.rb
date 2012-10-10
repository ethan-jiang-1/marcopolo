namespace :mp do

  def populate_search_place
    print "Macropolo: Populate SearchPlace table\n"

    print "  SearchPlace has " + SearchPlace.all.count.to_s + " item(s) before cleaning up...\n"
    SearchPlace.delete_all

    print "  SearchPlace has " + SearchPlace.all.count.to_s + " item(s) after cleaning up...\n"
    populate_from_place

    print "  SearchPlace has " + SearchPlace.all.count.to_s + " item(s) after population\n"

  end

  def create_search_place (pl, search_name)
    if search_name != nil && search_name.length != 0
      p = SearchPlace.create(:name => search_name)
      pl.search_places << p
      p.save!
    end
  end

  def populate_from_place
    Place.all.each do |pl|
      create_search_place(pl, pl.name)
      create_search_place(pl, pl.alt_name1)
      create_search_place(pl, pl.alt_name2)
      create_search_place(pl, pl.alt_name3)
    end
  end
end