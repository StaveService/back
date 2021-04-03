class Users::Musics::BandsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_music, only: [:create, :destroy]

  # # GET /bands
  # def index
    # render json: Band.ransack(params[:q] && JSON.parse(params[:q])).result
  # end

  # # GET /bands/1
  # def show
    # render json: @band, include: [:artists, musics: {include: [:user, :music_composers, :music_lyrists]}]
  # end

  # POST /bands
  def create
    if @music.update(band_id: band_params[:id])
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /bands/1
  # def update
    # if @band.update(band_params)
      # render json: @band
    # else
      # render json: @band.errors, status: :unprocessable_entity
    # end
  # end

  # DELETE /bands/1
  def destroy
    @music.update(band_id: nil)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = current_user.musics.find(params[:music_id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_params
      params.require(:band).permit(:id, :user_id, :music_id, :band_id)
    end
end
