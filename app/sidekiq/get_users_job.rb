class GetUsersJob
  include Sidekiq::Job

  def perform(*args)
    limit, skip = args
    response = DummyjsonService.new(limit, skip).call
    puts "Got these user #{response}"
  end
end
