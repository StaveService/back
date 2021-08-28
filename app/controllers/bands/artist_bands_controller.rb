module Bands
  class ArtistBandsController < ApiController
    before_action :authenticate_user!
    before_action :set_artist_bands

    def create
      @artist_band = @artist_bands.new(artist_id: artist_bands_params[:artist_id])

      if @artist_band.save
        render json: @artist_band, status: :created, include: :artist
      else
        render json: @artist_band.errors, status: :unprocessable_entity
      end
    end

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
      params.require(:artist_band).permit(:id, :band_id, :artist_id)
    end
  end
end
