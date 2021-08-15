module Users
  module Musics
    class MusicLinksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_music_link

      # PATCH/PUT /music_links/1
      def update
        if @music_link.update(music_link_params)
          render json: @music_link
        else
          render json: @music_link.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_music_link
        @music_link = MusicLink.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def music_link_params
        params.require(:music_link).permit(:itunes, :musixmatch, :spotify, :youtube, :music_id)
      end
    end
  end
end
