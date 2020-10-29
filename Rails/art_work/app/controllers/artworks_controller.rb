class ArtworksController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    if !user.nil?
      # the Artworks owned by a user
      owened_artworks = user.artworks
      # the Artworks shared with the user
      shared_with_user = user.shared_artworks
      render json: [ *owened_artworks, *shared_with_user ]
    else
      render json: []
    end
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
