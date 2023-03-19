class UsersController < ApplicationController
  before_action :set_users, only: %i[ show edit update destroy ]

  def index
    @users = User.all
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
    @user.destroy 
    
    respond_to do |format|
      format.html { redirect_to users_path, notice: "User successfully deleted." }
      format.turbo_stream { flash.now[:notice] = "User successfully deleted." }
    end
  end

  def seed_users
    # clear Users table
    User.destroy_all
    
    10.times do |x|
      skip = x*10
      response = GetUsersJob.perform_at(Time.now+skip,10, skip)
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone)
    end

    def set_users
      @user = User.find(params[:id])
    end
end