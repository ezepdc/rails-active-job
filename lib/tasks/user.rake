namespace :user do
  desc "TODO"
  task update_all: :environment do
  end

end


namespace :user do
  desc "Enrich all users with Clearbit (async)"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user.id)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
