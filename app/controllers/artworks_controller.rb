class ArtworksController < ApplicationController

  def index 
    @artworks = Artwork.visible_to(current_user)
  end

  def new
    @artwork = Artwork.new
  end
end
