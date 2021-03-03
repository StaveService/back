class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :update, :destroy]

  # GET /musics
  def index
    @musics = Music.all

    render json: @musics
  end

  # GET /musics/1
  def show
    render json: @music
  end

  # POST /musics
  def create
    @music = Music.new(music_params)

    if @music.save
      render json: @music, status: :created, location: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /musics/1
  def update
    if @music.update(music_params)
      render json: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  # DELETE /musics/1
  def destroy
    @music.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_params
      params.require(:music).permit(:artist_id, :user_id, :album_id, :title, :composer, :lyrist, :bpm, :time)
    end
end
