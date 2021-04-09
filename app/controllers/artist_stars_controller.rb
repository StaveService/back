class ArtistStarsController < ApplicationController
  before_action :set_artist_star, only: [:show, :update, :destroy]

  # GET /artist_stars
  def index
    @artist_stars = ArtistStar.all

    render json: @artist_stars
  end

  # GET /artist_stars/1
  def show
    render json: @artist_star
  end

  # POST /artist_stars
  def create
    @artist_star = ArtistStar.new(artist_star_params)

    if @artist_star.save
      render json: @artist_star, status: :created, location: @artist_star
    else
      render json: @artist_star.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artist_stars/1
  def update
    if @artist_star.update(artist_star_params)
      render json: @artist_star
    else
      render json: @artist_star.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artist_stars/1
  def destroy
    @artist_star.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_star
      @artist_star = ArtistStar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_star_params
      params.require(:artist_star).permit(:user_id, :artist_id)
    end
end
