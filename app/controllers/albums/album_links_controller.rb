module Albums
  class AlbumLinksController < ApiController
    before_action :authenticate_user!
    before_action :set_album_link

    # PATCH/PUT /band_links/1
    def update
      if @album_link.update(album_link_params)
        render json: @album_link
      else
        render json: @album_link.errors, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_album_link
      @album_link = AlbumLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_link_params
      params.require(:album_link).permit(:album_id, :itunes, :spotify)
    end
  end
end
