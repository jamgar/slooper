class GetUsersJob
  include Sidekiq::Job

  def perform(*args)
    puts "Getting users............"
  end
end
