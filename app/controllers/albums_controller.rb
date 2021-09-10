class AlbumsController < ApiController
  before_action :authenticate_user!
  before_action :set_album, only: %i[update destroy]
  before_action :set_locale

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, include: :link, status: :created, location: @album
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
    params.require(:album).permit(:title, link_attributes: [:itunes])
  end
end
