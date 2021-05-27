module Bands
  class BandBookmarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_band_bookmarks

    # # GET /band_bookmarks
    # def index
    # @band_bookmarks = BandBookmark.all

    # render json: @band_bookmarks
    # end

    # # GET /band_bookmarks/1
    # def show
    # render json: @band_bookmark
    # end

    # POST /band_bookmarks
    def create
      @band_bookmark = @band_bookmarks.new(user_id: current_user.id)

      if @band_bookmark.save
        render json: @band_bookmark, status: :created
      else
        render json: @band_bookmark.errors, status: :unprocessable_entity
      end
    end

    # # PATCH/PUT /band_bookmarks/1
    # def update
    # if @band_bookmark.update(band_bookmark_params)
    # render json: @band_bookmark
    # else
    # render json: @band_bookmark.errors, status: :unprocessable_entity
    # end
    # end

    # DELETE /band_bookmarks/1
    def destroy
      @band_bookmarks.find(params[:id]).destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_band_bookmarks
      @band_bookmarks = Band.find(params[:band_id]).band_bookmarks
    end

    # Only allow a trusted parameter "white list" through.
    def band_bookmark_params
      params.require(:band_bookmark).permit(:user_id, :band_id)
    end
  end
end
