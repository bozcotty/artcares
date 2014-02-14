class ArtworksController < ApplicationController

  def index 
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(params[:artwork])
    @artwork.user = current_user
      authorize! :create, Artwork, message: "You need to be signed up as an artist to list artworks."
    # or you could do it this way...(but this way makes more sense with the edit action)
    # @artwork.user = current_user.....
    # authorize! :create, @artwork
    if @artwork.save
      flash[:notice] = "Your artwork listing was saved successfully."
      redirect_to @artwork
    else
      flash[:error] = @artwork.errors.full_messages
      render :new
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @artwork = Artwork.find(params[:id])
    authorize! :update, @artwork, message: "You need to be an admin to do that."
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.user = current_user
    authorize! :update, Artwork, message: "You need to own the artwork to update it."
    if @artwork.update_attributes(params[:artwork])
      redirect_to @artwork, notice: "Artwork was updated successfully."
    else
      flash[:error] = "Error saving Artwork. Please try again."
      render :edit
    end
  end

end