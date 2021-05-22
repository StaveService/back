class Users::Musics::LyristMusicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lyrist_musics

  # POST /composers
  def create
    @lyrist_music = @lyrist_musics.new(artist_id: lyrist_music_params[:id])

    if @lyrist_music.save
      render json: @lyrist_music, status: :created
    else
      render json: @lyrist_music.errors, status: :unprocessable_entity
    end
  end

  # DELETE /composers/1
  def destroy
    @lyrist_musics.find_by(artist_id: params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyrist_musics
      @lyrist_musics = current_user.musics.find(params[:music_id]).lyrist_musics
    end

    # Only allow a trusted parameter "white list" through.
    def lyrist_music_params
      params.require(:lyrist_music).permit(:id, :user_id, :music_id, :artist_id)
    end
end
