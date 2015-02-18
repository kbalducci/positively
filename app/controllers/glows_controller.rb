class GlowsController < ApplicationController
  before_action :authenticate_user!

def index
    @user = User.all
    @glows = Glow.all
  end

  def new
    set_user
    set_new_glow
  end

  def create
      @glow = Glow.new(glow_params)
      user = current_user
      @glow.user_id = user.id
      respond_to do |format|
        if @glow.save
          format.html { redirect_to users_path, notice: 'Glow was successfully created.' }
          format.json { render :show, status: :created, location: @glow }

        else
          format.html { render :new }
          format.json { render json: @glow.errors, status: :unprocessable_entity }
        end
      end
  end


  private
    def set_glow
      @glow = Glow.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_new_glow
      @new_glow = Glow.new
    end

    def glow_params
    params.require(:glow).permit(:user_id, :quote, :subject, :author)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :avatar)
    end

end
