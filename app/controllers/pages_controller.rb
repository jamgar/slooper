class PagesController < ApplicationController
  def home 
    # @users = DummyjsonService.new.call
  end

  def seed_users
    GetUsersJob.perform_async()
  end
end
