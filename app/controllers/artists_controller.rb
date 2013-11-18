class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
    authorize! :create, @artist, message: "You need to be signed in as a member first."
  end

  def create
    @artist = Artist.new(params[:artist])
    authorize! :create, @artist, message: "You need to be signed in as a member first."
    if @artist.save
      flash[:notice] = "Your artist account was saved successfully."
      redirect_to @artist
    else
      flash[:error] = "Error saving artist account. Please try again."
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:aid])
    authorize! :update, @artist, message: "You need to own the artist account to update it."
  end

  def update
    @artist = Artist.find(params[:aid])
    authorize! :update, @artist, message: "You need to own the artist account to update it."
    if @artist.update_attributes(params[:artist])
      redirect_to @artist, notice: "Your artist account was updated successfully."
    else
      flash[:error] = "There was an error updating your artist account, please try again."
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:aid])
    authorize! :destroy, @artist, message: "You need to own the artist account to delete it."
    #create logic that reqs outstanding transactions be completed prior to closing account.
  end





  
end
