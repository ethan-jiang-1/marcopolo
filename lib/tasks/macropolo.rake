require 'faker'

namespace :mp do
  desc "Macropolo: populate constant tables"
  task :populate_constant => :environment do
    p "populate constant tables"
    populate_place_categories
    #Rake::Task['db:reset'].invoke
    #make_users
    #make_microposts
    #make_relationships
  end

  class PC_item  < Hash
     #def initialize()
     #  self[:name]  = ""
     #  self[:desc] = ""
     #  self[:is_spot] = false
     #end
     def create(name, desc)
       self[:name]  = name
       self[:desc] =  desc
       self[:is_spot] = false
       self
     end
     def as_spot
       self[:is_spot] = true
       self
     end
  end

  def populate_place_categories
    if PlaceCategory.all.size != 0
      p "the PlaceCategory is not empty, skip the populate"
      return
    end

    places = Array.new
    places << PC_item.new.create("earth", "the root")
    places << PC_item.new.create("country", "the country")
    places << PC_item.new.create("state", "the state")
    places << PC_item.new.create("county", "the county")
    places << PC_item.new.create("city", "the city")
    places << PC_item.new.create("town", "the town")
    places << PC_item.new.create("sight", "the sight")
    places << PC_item.new.create("building", "the building")
    places << PC_item.new.create("spot", "the spot").as_spot


    places.each do |pl|
      p pl
      PlaceCategory.create!(:name => pl[:name], :desc => pl[:desc], :is_spot => pl[:is_spot] )
    end
  end

end

