class HomeController < ApplicationController

  def index
  # @user = User.first
  @glows = Glow.all
  @users = User.all
  # user = current_user
  end
end
