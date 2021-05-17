class Albums::AlbumLinksController < ApplicationController
  before_action :set_album_link

  # # GET /album_links
  # def index
    # @album_links = AlbumLink.all

    # render json: @album_links
  # end

  # # GET /album_links/1
  # def show
    # render json: @album_link
  # end

  # POST /album_links
  def create
    @album_link = AlbumLink.new(album_link_params)

    if @album_link.save
      render json: @album_link, status: :created, location: @album_link
    else
      render json: @album_link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /album_links/1
  def update
    if @album_link.update(album_link_params)
      render json: @album_link
    else
      render json: @album_link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /album_links/1
  def destroy
    @album_link.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_link
      @album_link = AlbumLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_link_params
      params.require(:album_link).permit(:itunes, :album_id)
    end
end
