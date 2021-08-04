class ArtistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: %i[update destroy]

  # POST /artists
  def create
    Mobility.locale = params[:locale]
    @artist = Artist.new(artist_params)

    if @artist.save
      render json: @artist, include: :link, status: :created, location: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    Mobility.locale = params[:locale]
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def artist_params
    params.require(:artist).permit(:name, link_attributes: [:itunes])
  end
end
