class PagesController < ApplicationController
  def home 
    # @users = DummyjsonService.new.call
  end

  def seed_users
    10.times do |x|
      skip = x*10
      response = GetUsersJob.perform_async(10, skip)
    end
  end
end
