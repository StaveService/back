class Users::MusicsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_musics
  before_action :set_music, only: [:show, :update, :destroy]

  # GET /musics
  def index
    render json: @musics.ransack(params[:q]).result, include: [:user, :band, :music_composers, :music_lyrists]
  end

  # GET /musics/1
  def show
    render json: @music, include: [:user, :band, :albums, :music_composers, :music_lyrists, roles: {include: :artist}]
  end

  # POST /musics
  def create
    @music = @musics.new music_params


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
    def set_musics
      @musics = User.find(params[:user_id]).musics
    end

    def set_music
      @music = @musics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_params
      params.require(:music).permit(:user_id, :title, :bpm, :length, :release_date, :itunes_track_id)
    end

    def album_params
      params.require(:album).permit(:title, :release_date)
    end
end
