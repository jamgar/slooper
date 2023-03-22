class UserDeleteService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    @user.destroy
  end
end
