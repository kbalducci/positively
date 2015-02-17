class UsersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name)
    end
end
