class Artists::ArtistBookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist_bookmarks

  # # GET /artist_bookmarks
  # def index
    # @artist_bookmarks = ArtistBookmark.all

    # render json: @artist_bookmarks
  # end

  # # GET /artist_bookmarks/1
  # def show
    # render json: @artist_bookmark
  # end

  # POST /artist_bookmarks
  def create
    @artist_bookmark = @artist_bookmarks.new user_id: current_user.id

    if @artist_bookmark.save
      render json: @artist_bookmark, status: :created
    else
      render json: @artist_bookmark.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /artist_bookmarks/1
  # def update
    # if @artist_bookmark.update(artist_bookmark_params)
      # render json: @artist_bookmark
    # else
      # render json: @artist_bookmark.errors, status: :unprocessable_entity
    # end
  # end

  # DELETE /artist_bookmarks/1
  def destroy
    @artist_bookmarks.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_bookmarks
      @artist_bookmarks = Artist.find(params[:artist_id]).artist_bookmarks
    end

    # Only allow a trusted parameter "white list" through.
    def artist_bookmark_params
      params.require(:artist_bookmark).permit(:user_id, :artist_id)
    end
end
