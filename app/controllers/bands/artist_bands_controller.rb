class Bands::ArtistBandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist_bands

  # # GET /composers
  # def index
  # @composers = Composer.all

  # render json: @composers
  # end

  # # GET /composers/1
  # def show
  # render json: @composer
  # end

  # POST /composers
  def create
    @artist_band = @artist_bands.new(artist_id: artist_bands_params[:artist_id])

    if @artist_band.save
      render json: @artist_band, status: :created, include: :artist
    else
      render json: @artist_band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /composers/1
  # def update
  # if @composer.update(composer_params)
  # render json: @composer
  # else
  # render json: @composer.errors, status: :unprocessable_entity
  # end
  # end

  # DELETE /composers/1
  def destroy
    @artist_bands.find_by(artist_id: params[:id]).destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist_bands
    @artist_bands = Band.find(params[:band_id]).artist_bands
  end

  # Only allow a trusted parameter "white list" through.
  def artist_bands_params
    params.require(:artist_band).permit(:id, :band_id, :music_id, :artist_id)
  end
end
