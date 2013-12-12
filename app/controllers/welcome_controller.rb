class WelcomeController < ApplicationController

  # have conditionally render based on whether is_an_artist at login
  def index
    redirect_to welcome_dashboard_path if current_user && current_user.is_an_artist
  end

  def about
  end

  def dashboard
    @artworks = current_user.artworks
    @patient_campaigns = current_user.patient_campaigns
  end
end
