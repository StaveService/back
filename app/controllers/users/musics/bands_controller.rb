module Users
  module Musics
    class BandsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_music

      # POST /bands
      def create
        if @music.update(band_id: band_params[:id])
          render json: @band, status: :created, location: @band
        else
          render json: @band.errors, status: :unprocessable_entity
        end
      end

      # DELETE /bands/1
      def destroy
        @music.update(band_id: nil)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_music
        @music = User.find(params[:user_id]).musics.find(params[:music_id])
      end

      # Only allow a trusted parameter "white list" through.
      def band_params
        params.require(:band).permit(:id, :user_id, :music_id, :band_id)
      end
    end
  end
end
