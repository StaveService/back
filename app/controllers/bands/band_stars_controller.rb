class BandStarsController < ApplicationController
  before_action :set_band_stars, only: [:create, :destroy]

  # # GET /band_stars
  # def index
    # @band_stars = BandStar.all

    # render json: @band_stars
  # end

  # # GET /band_stars/1
  # def show
    # render json: @band_star
  # end

  # POST /band_stars
  def create
    @band_star = BandStar.new(band_star_params)

    if @band_star.save
      render json: @band_star, status: :created, location: @band_star
    else
      render json: @band_star.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /band_stars/1
  # def update
    # if @band_star.update(band_star_params)
      # render json: @band_star
    # else
      # render json: @band_star.errors, status: :unprocessable_entity
    # end
  # end

  # DELETE /band_stars/1
  def destroy
    @band_star.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_stars
      @band_star = Band.find(params[:band_id]).band_stars
    end

    # Only allow a trusted parameter "white list" through.
    def band_star_params
      params.require(:band_star).permit(:user_id, :band_id)
    end
end
