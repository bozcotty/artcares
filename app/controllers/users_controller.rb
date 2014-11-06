class UsersController < ApplicationController

# for showing the user his own list of artworks and patient campaigns privately

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @campaign = @user.campaign
  end

  # def destroy
  #   #add logic for not being able to destroy user account if there are outstanding sold, but not 'complete' artworks
  # end

end
