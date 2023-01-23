class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Calling API for #{user.email}"
    sleep 3
    puts "OK I'm done now"
  end
end
