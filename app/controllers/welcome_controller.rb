class WelcomeController < ApplicationController

  def index
  end

  # def index
  #    redirect_to welcome_dashboard_path if current_user
  # end

  def about
  end

  def learn
  end

  def artists_join_us
  end

  def dashboard
    @artworks = current_user.artworks
  end



  
end
