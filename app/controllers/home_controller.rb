class HomeController < ApplicationController

  def index
  # @user = User.first
  @glows = Glow.all.page params[:page]
  @users = User.all
  # user = current_user
  end
end
