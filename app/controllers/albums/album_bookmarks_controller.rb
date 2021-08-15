module Albums
  class AlbumBookmarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_album_bookmarks

    # POST /album_bookmarks
    def create
      @album_bookmark = @album_bookmarks.new user_id: current_user.id

      if @album_bookmark.save
        render json: @album_bookmark, status: :created
      else
        render json: @album_bookmark.errors, status: :unprocessable_entity
      end
    end

    # DELETE /album_bookmarks/1
    def destroy
      @album_bookmarks.find(params[:id]).destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_album_bookmarks
      @album_bookmarks = Album.find(params[:album_id]).album_bookmarks
    end

    # Only allow a trusted parameter "white list" through.
    def album_bookmark_params
      params.require(:album_bookmark).permit(:album_id)
    end
  end
end
