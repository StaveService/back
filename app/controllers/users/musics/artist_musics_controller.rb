module Users
  module Musics
    class ArtistMusicsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_artist_musics

      # POST /artist_musics
      def create
        @artist_music = @artist_musics.new(role: role_params[:role], artist_id: role_params[:artist_id])

        if @artist_music.save
          render json: @artist_music, status: :created, include: { artist: { include: :artist_link } }
        else
          render json: @artist_music.errors, status: :unprocessable_entity
        end
      end

      # DELETE /artist_musics/1
      def destroy
        @artist_musics.find(params[:id]).destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_artist_musics
        @artist_musics = User.find(params[:user_id]).musics.find(params[:music_id]).artist_musics
      end

      # Only allow a trusted parameter "white list" through.
      def role_params
        params.require(:artist_music).permit(:role, :artist_id, :user_id, :music_id)
      end
    end
  end
end
