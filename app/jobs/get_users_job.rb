class GetUsersJob < ApplicationJob

  def perform(limit, skip)
    response = DummyjsonService.new(limit, skip).call
    response['users'].each do |user|
      User.create!(first_name: user['firstName'],
                    last_name: user['lastName'],
                    email: user['email'],
                    phone: user['phone'])
    end
  end
end
