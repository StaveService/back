class Artists::ArtistLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist_link, only: [:update, :destroy]

  # # GET /artist_links
  # def index
    # @artist_links = ArtistLink.all

    # render json: @artist_links
  # end

  # # GET /artist_links/1
  # def show
    # render json: @artist_link
  # end

  # POST /artist_links
  def create
    @artist_link = ArtistLink.new(artist_link_params)

    if @artist_link.save
      render json: @artist_link, status: :created, location: @artist_link
    else
      render json: @artist_link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artist_links/1
  def update
    if @artist_link.update(artist_link_params)
      render json: @artist_link
    else
      render json: @artist_link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artist_links/1
  def destroy
    @artist_link.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_link
      @artist_link = ArtistLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_link_params
      params.require(:artist_link).permit(:artist_id, :itunes)
    end
end
