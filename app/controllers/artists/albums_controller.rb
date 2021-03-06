class Artists::AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :update, :destroy]

  # GET /artsts/1/albums
  def index
    render json: @albums.albums
  end

  # GET /artsts/1/albums/1
  def show
    render json: @album
  end

  # POST /artsts/1/albums
  def create
    @album = @artist.albums.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artsts/1/albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artsts/1/albums/1
  def destroy
    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
    
    def set_album
      @album = @artist.albums.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:references, :name, :country, :release_date)
    end
end
