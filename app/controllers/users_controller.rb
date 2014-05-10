class UsersController < ApplicationController

# for showing the user his own list of artworks and patient campaigns privately

  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    @patient_campaign = @user.patient_campaign
  end

end