class UserDeleteService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    @user.destroy
  end
end

# Path: spec/services/user_delete_service_spec.rb
# require 'rails_helper'

# RSpec.describe UserDeleteService do
#   let(:user) { create(:user) }

#   it 'deletes the user' do
#     expect { described_class.new(user).call }.to change { User.count }.by(-1)
#   end
#   
# end
