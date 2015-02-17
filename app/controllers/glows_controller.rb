class GlowsController < ApplicationController
  before_action :authenticate_user!


  private
    def glow_params
    params.require(:glow).permit(:user_id, :quote, :keyword, :author)
    end

end
