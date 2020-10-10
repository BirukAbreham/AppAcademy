namespace :db_tasks do
  desc "Deletes any shortened URLs that have not been visited in the last 10 minutes"
  task prune_url: :environment do
    ShorthenedUrl.prune(10)
  end
end
