module Bands
  class BandLinksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_band_link
    before_action :set_locale

    # PATCH/PUT /band_links/1
    def update
      if @band_link.update(band_link_params)
        render json: @band_link
      else
        render json: @band_link.errors, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_band_link
      @band_link = BandLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_link_params
      params.require(:band_link).permit(:band_id, :itunes, :twitter, :wikipedia, :youtube, :spotify)
    end
  end
end
