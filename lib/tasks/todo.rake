namespace :todo do
  desc "Deletes todos after 7 Days when they expire."
  task :delete_items => :environment do
    Item.where("created_at <= ?", Time.now - 7.days ).destroy_all
  end

end
 