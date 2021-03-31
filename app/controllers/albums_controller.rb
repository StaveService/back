class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_album, only: [:show, :update, :destroy]

  # GET /albums
  def index
    render json: Album.ransack(params[:q] && JSON.parse(params[:q])).result
  end

  # GET /albums/1
  def show
    render json: @album, include: [musics: {include: [:user, :band, :music_composers, :music_lyrists]}]
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:references, :name, :country, :release_date)
    end
end
