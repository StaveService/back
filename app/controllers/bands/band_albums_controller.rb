module Bands
  class BandAlbumsController < ApiController
    before_action :authenticate_user!
    before_action :set_band_albums

    # # GET /band_albums
    # def index
    # @band_albums = BandAlbum.all

    # render json: @band_albums
    # end

    # # GET /band_albums/1
    # def show
    # render json: @band_album
    # end

    # POST /band_albums
    def create
      @band_album = @band_albums.new(band_album_params)

      if @band_album.save
        render json: @band_album, status: :created, include: :album
      else
        render json: @band_album.errors, status: :unprocessable_entity
      end
    end

    # # PATCH/PUT /band_albums/1
    # def update
    # if @band_album.update(band_album_params)
    # render json: @band_album
    # else
    # render json: @band_album.errors, status: :unprocessable_entity
    # end
    # end

    # DELETE /band_albums/1
    def destroy
      @band_albums.find_by(album_id: params[:id]).destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_band_albums
      @band_albums = Band.find(params[:band_id]).band_albums
    end

    # Only allow a trusted parameter "white list" through.
    def band_album_params
      params.require(:band_album).permit(:band_id, :album_id)
    end
  end
end
