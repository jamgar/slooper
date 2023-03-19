class UserReaderService < BaseService
  def call
    users_count = total_users
    page_size = 10
    skip = 0

    batch_count = users_count / page_size
    batch_count.times do |batch|
      GetUsersJob.perform_later(page_size, skip)
      skip = skip + page_size
    end
  end

  private
    def total_users
      response = DummyjsonService.new.call
      response["total"].to_i
    end
end
