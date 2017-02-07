namespace :todo do
  desc "Deletes todos after they expire. 7 Days."
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
