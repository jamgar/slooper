class UserMailer < ApplicationMailer
  after_action :user_delete

  def user_deleted(user)
    @user = user
    mail(to: @user.email, subject: 'User deleted')
  end  

  private
    def user_delete
      UserDeleteService.new(@user).call
    end
end
