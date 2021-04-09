class Bands::BandAlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_band_albums, only: [:create, :destroy]
  before_action :set_band_album, only: [:destroy]

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
      render json: @band_album, status: :created, location: @band_album, include: :album
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
    @band_album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_albums
      @band_albums = Band.find(params[:band_id]).band_albums
    end

    def set_band_album
      @band_album = @band_albums.find_by(album_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_album_params
      params.require(:band_album).permit(:band_id, :album_id)
    end
end
