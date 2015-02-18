class DashboardController < ApplicationController
  def index
    @title = "Positivity | Dashboard"
    @users = User.all
  end

  def reports
  end

  def all_report
    respond_to do |format|
      format.csv do
        render text: User.to_csv
      end
    end
  end

  def other_report
    respond_to do |format|
      format.csv do
        render text: Glow.to_csv
      end
    end
  end

end
