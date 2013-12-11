class UsersController < ApplicationController

# for showing the user his own list of artworks and patient campaigns privately

  def index
  end

  def show
    @user = User.find(params[:id])
  end

end