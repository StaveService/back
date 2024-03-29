module Users
  module Musics
    class AlbumMusicsController < ApiController
      before_action :authenticate_user!
      before_action :set_current_user_music_album_musics

      def create
        @album_music = @album_musics.new(album_id: params[:album_id])

        if @album_music.save
          render json: @album_music, status: :created, include: { album: { include: :link } },
                 key_transform: :camel_lowers
        else
          render json: @album_music.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @album_musics.find_by(album_id: params[:id]).destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_current_user_music_album_musics
        @album_musics = User.find(params[:user_id]).musics.find(params[:music_id]).album_musics
      end

      # Only allow a trusted parameter "white list" through.
      def album_music_params
        params.require(:album_music).permit(:album_id, :user_id, :music_id)
      end
    end
  end
end
