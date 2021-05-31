module Users
  module Musics
    class MusicBookmarksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_music_bookmarks

      # POST /music_bookmarks
      def create
        @music_bookmark = @music_bookmarks.new(user_id: current_user.id)

        if @music_bookmark.save
          render json: @music_bookmark, status: :created
        else
          render json: @music_bookmark.errors, status: :unprocessable_entity
        end
      end

      # DELETE /music_bookmarks/1
      def destroy
        @music_bookmarks.find(params[:id]).destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_music_bookmarks
        @music_bookmarks = Music.find(params[:music_id]).music_bookmarks
      end

      # Only allow a trusted parameter "white list" through.
      def music_bookmark_params
        params.require(:music_bookmark).permit(:music_id)
      end
    end
  end
end
