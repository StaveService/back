module Users
  module Musics
    class ComposerMusicsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_composer_musics

      # POST /composers
      def create
        @composer_music = @composer_musics.new(artist_id: composer_music_params[:id])
        if @composer_music.save
          render json: @composer_music, status: :created
        else
          render json: @composer_music.errors, status: :unprocessable_entity
        end
      end

      # DELETE /composers/1
      def destroy
        @composer_musics.find_by(artist_id: params[:id]).destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_composer_musics
        @composer_musics = User.find(params[:user_id]).musics.find(params[:music_id]).composer_musics
      end

      # Only allow a trusted parameter "white list" through.
      def composer_music_params
        params.require(:composer_music).permit(:id, :music_id, :artist_id)
      end
    end
  end
end
