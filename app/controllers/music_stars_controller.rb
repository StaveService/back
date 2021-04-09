class MusicStarsController < ApplicationController
  before_action :set_music_star, only: [:show, :update, :destroy]

  # GET /music_stars
  def index
    @music_stars = MusicStar.all

    render json: @music_stars
  end

  # GET /music_stars/1
  def show
    render json: @music_star
  end

  # POST /music_stars
  def create
    @music_star = MusicStar.new(music_star_params)

    if @music_star.save
      render json: @music_star, status: :created, location: @music_star
    else
      render json: @music_star.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /music_stars/1
  def update
    if @music_star.update(music_star_params)
      render json: @music_star
    else
      render json: @music_star.errors, status: :unprocessable_entity
    end
  end

  # DELETE /music_stars/1
  def destroy
    @music_star.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music_star
      @music_star = MusicStar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_star_params
      params.require(:music_star).permit(:user_id, :music_id)
    end
end
