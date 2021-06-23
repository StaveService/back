module Artists
  class ArtistLinksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_artist_link

    # PATCH/PUT /artist_links/1
    def update
      if @artist_link.update(artist_link_params)
        render json: @artist_link
      else
        render json: @artist_link.errors, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_artist_link
      @artist_link = ArtistLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_link_params
      params.require(:artist_link).permit(:artist_id, :itunes, :twitter, :wikipedia, :spotify)
    end
  end
end
