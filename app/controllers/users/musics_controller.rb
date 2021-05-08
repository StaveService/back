class Users::MusicsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_musics, only: [:index, :show]
  before_action :set_music, only: [:show]
  before_action :set_current_user_musics, only: [:create, :update, :destroy]
  before_action :set_current_user_music, only: [:update, :destroy]

  # GET /musics
  def index
    render json: @musics.ransack(params[:q] && JSON.parse(params[:q])).result, include: [:user, :band, :music_composers, :music_lyrists]
  end

  # GET /musics/1
  def show
    @music.current_user = current_user
    render json: @music, include: [:user, :band, :albums, :music_composers, :music_lyrists,  artist_musics: {include: :artist}], methods: [:bookmark]
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
    current_user.musics.find(params[:id]).destroy
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

    def set_current_user_musics
      @musics = current_user.musics
    end

    def set_current_user_music
      @music = current_user.musics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_params
      params.require(:music).permit(:user_id, :title, :tab, :itunes_track_id)
    end
end
