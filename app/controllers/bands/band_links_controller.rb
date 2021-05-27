module Bands
  class BandLinksController < ApplicationController
    before_action :set_band_link, only: %i[update destroy]

    # # GET /band_links
    # def index
    # @band_links = BandLink.all

    # render json: @band_links
    # end

    # # GET /band_links/1
    # def show
    # render json: @band_link
    # end

    # POST /band_links
    def create
      @band_link = BandLink.new(band_link_params)

      if @band_link.save
        render json: @band_link, status: :created, location: @band_link
      else
        render json: @band_link.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /band_links/1
    def update
      if @band_link.update(band_link_params)
        render json: @band_link
      else
        render json: @band_link.errors, status: :unprocessable_entity
      end
    end

    # DELETE /band_links/1
    def destroy
      @band_link.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_band_link
      @band_link = BandLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_link_params
      params.require(:band_link).permit(:band_id, :itunes)
    end
  end
end
