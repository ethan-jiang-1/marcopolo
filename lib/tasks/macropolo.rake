require 'faker'

namespace :mp do
  desc "Macropolo: populate constant tables"
  task :populate_constant => :environment do
    p "populate constant tables"
    #Rake::Task['db:reset'].invoke
    #make_users
    #make_microposts
    #make_relationships
  end
end

