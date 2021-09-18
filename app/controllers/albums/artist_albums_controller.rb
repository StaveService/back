module Albums
  class ArtistAlbumsController < ApiController
    before_action :authenticate_user!
    before_action :set_artist_albums

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
      @artist_album = @artist_albums.new(artist_album_params)

      if @artist_album.save
        render json: @artist_album, status: :created, include: :artist
      else
        render json: @artist_album.errors, status: :unprocessable_entity
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
      @artist_albums.find_by(artist_id: params[:id]).destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_artist_albums
      @artist_albums = Album.find(params[:album_id]).artist_albums
    end

    # Only allow a trusted parameter "white list" through.
    def artist_album_params
      params.require(:artist_album).permit(:artist_id, :album_id)
    end
  end
end
