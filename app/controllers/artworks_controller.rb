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

end