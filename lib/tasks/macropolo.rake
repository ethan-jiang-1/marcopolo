require 'faker'
#load  './macropolo_place_category.rb'
require File.join File.dirname(__FILE__), 'macropolo_populate_place_category'    #for ruby 1.8,  use require_relative for 1.9
require File.join File.dirname(__FILE__), 'macropolo_populate_place'    #for ruby 1.8,  use require_relative for 1.9

namespace :mp do
  desc "Macropolo: populate constant tables"
  task :populate => :environment do
    #p "Macropolo: db:reset before data population"
    #Rake::Task['db:reset'].invoke

    populate_place_category
    populate_place
    #make_users
    #make_microposts
    #make_relationships
  end
end

