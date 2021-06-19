module Users
  module Musics
    class MusicLinksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_music_link, only: %i[update destroy]

      # POST /music_links
      def create
        @music_link = MusicLink.new(music_link_params)

        if @music_link.save
          render json: @music_link, status: :created, location: @music_link
        else
          render json: @music_link.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /music_links/1
      def update
        if @music_link.update(music_link_params)
          render json: @music_link
        else
          render json: @music_link.errors, status: :unprocessable_entity
        end
      end

      # DELETE /music_links/1
      def destroy
        @music_link.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_music_link
        @music_link = MusicLink.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def music_link_params
        params.require(:music_link).permit(:itunes, :musixmatch, :spotify, :music_id)
      end
    end
  end
end
