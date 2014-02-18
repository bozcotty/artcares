class WelcomeController < ApplicationController

  # def index
  #   redirect_to welcome_dashboard_path if current_user
  # end

  def about
  end

  def dashboard
    @artworks = current_user.artworks
    @patient_campaigns = current_user.patient_campaigns
  end
end
