class UsersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

def index
  @user = current_user
  @glows = Glow.all
end

def new
  @user = User.new
  @glow = Glow.new
end

def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render "welcome/index" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :avatar)
    end
end
