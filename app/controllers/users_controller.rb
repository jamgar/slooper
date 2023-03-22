class UsersController < ApplicationController
  before_action :set_users, only: %i[ show edit update destroy ]

  def index
    @users = User.where(is_deleted: false)
    if params[:query].present?
      @users = @users.where("first_name Like ?", "%#{params[:query]}%").or(User.where("email Like ?", "%#{params[:query]}%")) 
    elsif params[:filter_option].present?
      @users = @users.where("#{params[:filter_option]} Like ?", "%#{params[:filter]}%")
    end
    @pagy, @users = pagy(@users.all, items: 5)
  end

  def show 
  end

  def new 
    @user = User.new 
  end

  def create 
    @user = User.new(user_params) 
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User successfully created." }
        format.turbo_stream { flash.now[:notice] = "User successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit 
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User successfully updated." }
        format.turbo_stream { flash.now[:notice] = "User successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }  
      end
    end
  end

  def destroy
    @user.is_deleted = true

    UserMailer.user_deleted(@user).deliver_later(wait: 30.seconds)

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User successfully deleted." }
      format.turbo_stream { flash.now[:notice] = "User successfully deleted." }
    end
  end
  
  def deleteall
    # User.destroy_by(id: params[:user_ids])
    @users = User.find(params[:user_ids])
    @users.each do |user|
      user.is_deleted = true
      user.save
      UserMailer.user_deleted(user).deliver_later(wait: 30.seconds)
    end

    respond_to do |format|
      format.html { redirect_to users_path, notice: "Users successfully deleted." }
    end
  end 

  def seed_users
    User.destroy_all

    UserReaderService.call
  end

  def clear_filter
    clear_session(:filter_option, :filter)
    @users = Users.all
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone)
    end

    def set_users
      @user = User.find(params[:id])
    end
end
