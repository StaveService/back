class BandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_band, only: [:update, :destroy]

  # GET /bands
  def index
    render json: Band.ransack(params[:q] && JSON.parse(params[:q])).result
  end

  # GET /bands/1
  def show
    @band.current_user = current_user
    render json: @band, include: [:artists, :albums, musics: {include: [:user, :composers, :lyrists]}], methods: [:bookmark]
  end

  # POST /bands
  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_params
      params.require(:band).permit(:name)
    end
end
